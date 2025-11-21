package com.ecommerce.controller;

import com.ecommerce.dao.ProductDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        if (request.getSession().getAttribute("admin") == null) {
            response.sendRedirect("admin/login.jsp");
            return;
        }
        int id = Integer.parseInt(request.getParameter("id"));
        ProductDAO dao = new ProductDAO();
        dao.deleteProduct(id);
        response.sendRedirect("admin/view-products.jsp?success=Deleted");
    }
}