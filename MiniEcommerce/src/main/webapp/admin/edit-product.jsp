<%@ page import="com.ecommerce.dao.ProductDAO" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int id = Integer.parseInt(request.getParameter("id"));
    ProductDAO dao = new ProductDAO();
    Product p = dao.getProductById(id);
    if (p == null) response.sendRedirect("view-products.jsp");
%>
<html>
<head>
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Edit Product</h2>
    <form action="../UpdateProductServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%= p.getId() %>">
        <div class="row">
            <div class="col-md-6 mb-3"><input type="text" name="name" value="<%= p.getName() %>" class="form-control" required></div>
            <div class="col-md-6 mb-3"><input type="text" name="category" value="<%= p.getCategory() %>" class="form-control" required></div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3"><input type="number" step="0.01" name="price" value="<%= p.getPrice() %>" class="form-control" required></div>
            <div class="col-md-6 mb-3"><input type="number" name="stock" value="<%= p.getStock() %>" class="form-control" required></div>
        </div>
        <div class="mb-3"><textarea name="description" class="form-control" rows="4"><%= p.getDescription() %></textarea></div>
        <div class="mb-3"><input type="file" name="image" class="form-control" accept="image/*"></div>
        <button type="submit" class="btn btn-primary">Update Product</button>
    </form>
</div>
</body>
</html>