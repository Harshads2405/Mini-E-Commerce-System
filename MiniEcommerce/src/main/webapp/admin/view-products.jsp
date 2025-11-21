<%@ page import="com.ecommerce.dao.ProductDAO" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>View All Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">📦 All Products (Admin)</h2>
    <a href="add-product.jsp" class="btn btn-success mb-3">+ Add New Product</a>
    <table class="table table-bordered table-hover">
        <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            ProductDAO dao = new ProductDAO();
            List<Product> products = dao.getAllProducts();
            for (Product p : products) {
        %>
            <tr>
                <td><%= p.getId() %></td>
                <td>
                    <% if (p.getImage() != null) { %>
                        <img src="../uploads/<%= p.getImage() %>" width="60" height="60" class="rounded">
                    <% } else { %> No Image <% } %>
                </td>
                <td><%= p.getName() %></td>
                <td><%= p.getCategory() %></td>
                <td>₹<%= p.getPrice() %></td>
                <td><%= p.getStock() %></td>
                <td>
                    <a href="edit-product.jsp?id=<%= p.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="../DeleteProductServlet?id=<%= p.getId() %>" class="btn btn-danger btn-sm"
                       onclick="return confirm('Delete this product?')">Delete</a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>