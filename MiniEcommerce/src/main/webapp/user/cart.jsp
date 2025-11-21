<%@ page import="com.ecommerce.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>🛒 Your Cart</h2>
    <%
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
        <p class="alert alert-info">Your cart is empty! <a href="products.jsp">Continue Shopping</a></p>
    <% } else {
        double total = 0;
    %>
    <table class="table table-striped">
        <thead><tr><th>Product</th><th>Price</th><th>Qty</th><th>Total</th><th>Action</th></tr></thead>
        <tbody>
        <% for (CartItem item : cart) {
            total += item.getTotal();
        %>
            <tr>
                <td><%= item.getProduct().getName() %></td>
                <td>₹<%= String.format("%.2f", item.getProduct().getPrice()) %></td>
                <td>
                    <form action="../UpdateCartServlet" method="post" class="d-inline">
                        <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>">
                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" max="<%= item.getProduct().getStock() %>" class="form-control d-inline w-50">
                        <button type="submit" class="btn btn-sm btn-warning">Update</button>
                    </form>
                </td>
                <td>₹<%= String.format("%.2f", item.getTotal()) %></td>
                <td><a href="../RemoveFromCartServlet?productId=<%= item.getProduct().getId() %>" class="btn btn-danger btn-sm">Remove</a></td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <h3>Total Amount: ₹<%= String.format("%.2f", total) %></h3>
    <a href="checkout.jsp" class="btn btn-success btn-lg">Proceed to Checkout</a>
    <% } %>
</div>
</body>
</html>