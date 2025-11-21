<%@ page import="java.sql.*" %>
<%@ page import="com.ecommerce.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>View All Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>🧾 All Orders</h2>
    <table class="table table-bordered">
        <thead><tr><th>Order ID</th><th>Customer</th><th>Email</th><th>Total</th><th>Date</th><th>Action</th></tr></thead>
        <tbody>
        <%
            try (Connection con = DBConnection.getConnection();
                 Statement st = con.createStatement();
                 ResultSet rs = st.executeQuery("SELECT * FROM orders ORDER BY order_date DESC")) {
                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("customer_name") %></td>
                <td><%= rs.getString("customer_email") %></td>
                <td>₹<%= rs.getDouble("total_amount") %></td>
                <td><%= rs.getTimestamp("order_date") %></td>
                <td><a href="order-details.jsp?id=<%= rs.getInt("id") %>" class="btn btn-info btn-sm">View Details</a></td>
            </tr>
        <% } } catch (Exception e) { e.printStackTrace(); } %>
        </tbody>
    </table>
</div>
</body>
</html>