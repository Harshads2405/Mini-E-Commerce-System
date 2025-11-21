<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thank You!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-success text-white">
<div class="container text-center mt-5 pt-5">
    <h1 class="display-3">🎉 Thank You!</h1>
    <p class="lead">Your order has been placed successfully!</p>
    <h3>Order ID: <%= request.getParameter("orderId") %></h3>
    <a href="products.jsp" class="btn btn-light btn-lg mt-4">Continue Shopping</a>
</div>
</body>
</html>