<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #667eea, #764ba2); height: 100vh; }
    </style>
</head>
<body class="d-flex align-items-center">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card shadow-lg">
                <div class="card-body p-5">
                    <h3 class="text-center mb-4 text-primary">🔐 Admin Login</h3>
                    <form action="../AdminLoginServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Login</button>
                    </form>
                    <p class="text-center mt-3 text-muted small">
                        Demo: admin / admin123
                    </p>
                    <% if(request.getParameter("error") != null) { %>
                        <div class="alert alert-danger mt-3 text-center">
                            <%= request.getParameter("error") %>
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>