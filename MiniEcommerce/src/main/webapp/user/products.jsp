<%@ page import="com.ecommerce.dao.ProductDAO" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shop Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">🛍️ All Products</h2>
    <div class="row">
        <%
            ProductDAO dao = new ProductDAO();
            List<Product> products = dao.getAllProducts();
            for (Product p : products) {
                if (p.getStock() <= 0) continue;
        %>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow">
                <% if (p.getImage() != null) { %>
                    <img src="../uploads/<%= p.getImage() %>" class="card-img-top" style="height: 200px; object-fit: cover;">
                <% } else { %>
                    <img src="https://via.placeholder.com/300x200?text=No+Image" class="card-img-top">
                <% } %>
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title"><%= p.getName() %></h5>
                    <p class="text-muted">Category: <%= p.getCategory() %></p>
                    <p class="card-text flex-grow-1"><%= p.getDescription().length() > 100 ? p.getDescription().substring(0,100)+"..." : p.getDescription() %></p>
                    <div class="mt-auto">
                        <h4 class="text-success">₹<%= String.format("%.2f", p.getPrice()) %></h4>
                        <p class="text-muted">Stock: <%= p.getStock() %></p>
                        <form action="../AddToCartServlet" method="post">
                            <input type="hidden" name="productId" value="<%= p.getId() %>">
                            <button type="submit" class="btn btn-primary w-100">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>