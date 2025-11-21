<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark bg-primary">
    <div class="container-fluid">
        <span class="navbar-brand">Welcome Admin 👋</span>
        <a href="logout.jsp" class="btn btn-danger btn-sm">Logout</a>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="text-center mb-4">Admin Panel</h2>
    <div class="row g-4">
        <div class="col-md-4">
            <a href="add-product.jsp" class="btn btn-success btn-lg w-100 p-4">➕ Add New Product</a>
        </div>
        <div class="col-md-4">
            <a href="view-products.jsp" class="btn btn-info btn-lg w-100 p-4 text-white">📦 View All Products</a>
        </div>
        <div class="col-md-4">
            <a href="view-orders.jsp" class="btn btn-warning btn-lg w-100 p-4">🧾 View All Orders</a>
        </div>
    </div>
</div>
</body>
</html>