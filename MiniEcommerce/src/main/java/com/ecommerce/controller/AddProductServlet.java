package com.ecommerce.controller;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.apache.commons.io.FilenameUtils;

import java.io.File;
import java.io.IOException;

@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold = 1024*1024*2, maxFileSize = 1024*1024*10)
public class AddProductServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("admin") == null) {
            response.sendRedirect("admin/login.jsp");
            return;
        }

        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String description = request.getParameter("description");

        // Handle image upload
        String imageName = null;
        Part part = request.getPart("image");
        if (part != null && part.getSize() > 0) {
            String fileName = extractFileName(part);
            String extension = FilenameUtils.getExtension(fileName);
            imageName = System.currentTimeMillis() + "." + extension;

            String savePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) fileSaveDir.mkdir();

            part.write(savePath + File.separator + imageName);
        }

        Product product = new Product(name, category, price, stock, description, imageName);
        ProductDAO dao = new ProductDAO();
        dao.addProduct(product);

        response.sendRedirect("admin/view-products.jsp?success=Product added successfully");
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}