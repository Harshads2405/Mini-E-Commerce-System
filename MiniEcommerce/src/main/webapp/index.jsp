<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mini E-Commerce System - J2EE Project</titzle>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .hero-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
            backdrop-filter: blur(10px);
        }
        .btn-custom {
            padding: 15px 40px;
            font-size: 1.2rem;
            border-radius: 50px;
            font-weight: bold;
            transition: all 0.3s;
        }
        .btn-custom:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body class="d-flex align-items-center">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="hero-card p-5 text-center">
                <h1 class="display-3 fw-bold text-primary mb-3">
                    🛒 Mini E-Commerce System
                </h1>
                <h2 class="display-6 text-secondary mb-4">
                    J2EE Project Assignment
                </h2>
                <hr class="w-50 mx-auto mb-5">

                <div class="row g-4 mb-5">
                    <div class="col-md-6">
                        <a href="user/products.jsp" class="btn btn-success btn-custom w-100">
                            🛍️ Shop Now (Public View)
                        </a>
                    </div>
                    <div class="col-md-6">
                        <a href="admin/login.jsp" class="btn btn-warning btn-custom w-100 text-dark">
                            🔐 Admin Login
                        </a>
                    </div>
                </div>

                <div class="bg-light rounded p-4">
                    <h4 class="text-primary mb-3">Project Features Implemented:</h4>
                    <div class="row text-start">
                        <div class="col-md-6">
                            <ul class="list-unstyled">
                                <li class="mb-2">✅ Admin Login & Dashboard</li>
                                <li class="mb-2">✅ Add/Edit/Delete Products</li>
                                <li class="mb-2">✅ Product Image Upload</li>
                                <li class="mb-2">✅ Public Product Browsing</li>
                                <li class="mb-2">✅ Session-based Shopping Cart</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <ul class="list-unstyled">
                                <li class="mb-2">✅ Update Quantity / Remove Item</li>
                                <li class="mb-2">✅ Checkout & Order Placement</li>
                                <li class="mb-2">✅ Thank You Page</li>
                                <li class="mb-2">✅ View All Orders (Admin)</li>
                                <li class="mb-2">✅ Order Details with Items</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <footer class="mt-5 text-muted">
                    <p class="mb-1">Technology: Java Servlet • JSP • JDBC • MySQL • MVC • Session Management</p>
                    <p>HTML/CSS with Bootstrap 5 • 100% Original Code</p>
                </footer>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>