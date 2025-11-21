# Mini E-Commerce System – J2EE Project Assignment

**Project Title:** Mini E-Commerce System  
**Course:** Advanced Java / J2EE  
**Date:** November 2025

---

## Project Overview

A complete **Mini E-Commerce System** developed using pure **Java Servlets, JSP, JDBC, MySQL** following **MVC Architecture** and **Session Management** – exactly as specified in the assignment.

### Features Implemented (100% Match with Requirement)

#### Product Management Module (Admin)
- Admin Login Page (`admin/login.jsp`)
- Add New Product (with image upload – optional)
- Edit Existing Product
- Delete Product
- View All Products in List/Table Format
- Each product contains: **Product Name, Category, Price, Stock, Description, Image (optional)**

#### Shopping Module (User – Guest Mode, No Registration Required)
- View All Products Page (public)
- Add to Cart (Session-based)
- View Cart
- Update Quantity
- Remove Item from Cart
- Proceed to Checkout
- Order Confirmation (Thank You Page)

#### Order Management (Admin Side)
- View All Orders
- View Order Details (Items purchased, quantities, prices, totals)

### Technology Stack (Exactly as Required)
- Java Servlets
- JSP
- JDBC
- MVC Architecture
- Session Management
- HTML/CSS + Bootstrap 5 (used for beautiful UI)
- MySQL Database

---

## Project Structure (Standard J2EE)

MiniEcommerce/
├── src/main/java/com/ecommerce/
│   ├── controller/   → All Servlets
│   ├── dao/          → ProductDAO.java
│   ├── model/        → Product.java, CartItem.java
│   └── util/         → DBConnection.java
├── src/main/webapp/
│   ├── admin/        → All admin pages
│   ├── user/         → All user pages
│   ├── uploads/      → Product images
│   ├── WEB-INF/web.xml
│   └── index.jsp     → Beautiful home page
└── ecommerce.sql     → Complete database script


---

## Database Setup (`ecommerce.sql`)
```sql
-- Run this in MySQL Workbench / phpMyAdmin
CREATE DATABASE ecommerce;
USE ecommerce;

-- Tables: products, orders, order_items, admin
-- Admin default login: username = admin, password = admin123
```

## How to Run the Project (Tested on IntelliJ Community + Tomcat 10 – 2025)

### Step 1: Setup Requirements
- MySQL 8.0+
- Apache Tomcat 10
- IntelliJ IDEA Community Edition
- JDK 11 or 17

### Step 2: Add Required JAR Files
Add these 3 JARs to Project → Libraries:
1. `mysql-connector-j-8.4.0.jar`
2. `commons-fileupload-1.5.jar`
3. `commons-io-2.16.1.jar`

### Step 3: Setup Database
1. Open MySQL Workbench
2. Run the file `ecommerce.sql` (included in project)
3. Default Admin Login:  
   **Username:** `admin`  
   **Password:** `admin123`

### Step 4: Update Database Password
Open: `src/main/java/com/ecommerce/util/DBConnection.java`  
Change this line:
```java
private static final String PASS = "Ha@2405";
→ Replace with your actual MySQL password 
Step 5: Run Using Tomcat (2 Ways – Both Work in Community Edition)
```
Manual WAR Deployment (Recommended & Easiest)

Build WAR:
File → Project Structure → Artifacts → + → Web Application: Archive → For 'MiniEcommerce'
Build → Build Artifacts → Build

Copy generated MiniEcommerce.war to:
Your_Tomcat_Folder/webapps/
Start Tomcat:
Double-click bin/startup.bat (Windows) or ./startup.sh (Linux/Mac)

Open browser: http://localhost:8080/MiniEcommerce

