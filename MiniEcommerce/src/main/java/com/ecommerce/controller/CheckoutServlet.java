package com.ecommerce.controller;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.CartItem;
import com.ecommerce.util.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("user/cart.jsp");
            return;
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        double total = cart.stream().mapToDouble(CartItem::getTotal).sum();

        try (Connection con = DBConnection.getConnection()) {
            con.setAutoCommit(false);

            // Save order
            String orderSql = "INSERT INTO orders (customer_name, customer_email, customer_phone, customer_address, total_amount) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, name); ps.setString(2, email); ps.setString(3, phone);
            ps.setString(4, address); ps.setDouble(5, total);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            int orderId = rs.next() ? rs.getInt(1) : 0;

            // Save order items + update stock
            String itemSql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement psItem = con.prepareStatement(itemSql);
            ProductDAO dao = new ProductDAO();

            for (CartItem item : cart) {
                psItem.setInt(1, orderId);
                psItem.setInt(2, item.getProduct().getId());
                psItem.setInt(3, item.getQuantity());
                psItem.setDouble(4, item.getProduct().getPrice());
                psItem.addBatch();

                int newStock = item.getProduct().getStock() - item.getQuantity();
                dao.updateStock(item.getProduct().getId(), newStock);
            }
            psItem.executeBatch();
            con.commit();

            session.removeAttribute("cart");
            response.sendRedirect("thankyou.jsp?orderId=" + orderId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("user/checkout.jsp?error=Order failed");
        }
    }
}