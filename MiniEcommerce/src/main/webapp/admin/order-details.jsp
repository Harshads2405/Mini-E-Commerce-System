<%@ page import="java.sql.*" %>
<%@ page import="com.ecommerce.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int orderId = Integer.parseInt(request.getParameter("id"));
%>
<html>
<head>
    <title>Order Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Order #<%= orderId %> Details</h2>
    <%
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM orders WHERE id = ?");
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
    %>
    <div class="card mb-4">
        <div class="card-body">
            <p><strong>Name:</strong> <%= rs.getString("customer_name") %></p>
            <p><strong>Email:</strong> <%= rs.getString("customer_email") %></p>
            <p><strong>Phone:</strong> <%= rs.getString("customer_phone") %></p>
            <p><strong>Address:</strong> <%= rs.getString("customer_address") %></p>
            <p><strong>Total:</strong> ₹<%= rs.getDouble("total_amount") %></p>
        </div>
    </div>
    <h4>Items Purchased:</h4>
    <table class="table">
        <thead><tr><th>Product ID</th><th>Quantity</th><th>Price</th><th>Total</th></tr></thead>
        <tbody>
        <%
            PreparedStatement ps2 = con.prepareStatement("SELECT * FROM order_items WHERE order_id = ?");
            ps2.setInt(1, orderId);
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
        %>
            <tr>
                <td><%= rs2.getInt("product_id") %></td>
                <td><%= rs2.getInt("quantity") %></td>
                <td>₹<%= rs2.getDouble("price") %></td>
                <td>₹<%= rs2.getDouble("price") * rs2.getInt("quantity") %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <% } } %>
    <a href="view-orders.jsp" class="btn btn-secondary">Back</a>
</div>
</body>
</html>