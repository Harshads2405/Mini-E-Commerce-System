package com.ecommerce.controller;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/UpdateProductServlet")
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String description = request.getParameter("description");

        String imageName = null;
        Part part = request.getPart("image");
        if (part != null && part.getSize() > 0) {
            imageName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
            String savePath = request.getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            part.write(savePath + File.separator + imageName);
        }

        Product p = new Product();
        p.setId(id);
        p.setName(name);
        p.setCategory(category);
        p.setPrice(price);
        p.setStock(stock);
        p.setDescription(description);
        if (imageName != null) p.setImage(imageName);

        ProductDAO dao = new ProductDAO();
        dao.updateProduct(p);

        response.sendRedirect("admin/view-products.jsp?success=Updated");
    }
}