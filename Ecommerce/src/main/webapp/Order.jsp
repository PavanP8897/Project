<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
<style>
    .btn-incre, .btn-decre {
        box-shadow: none;
        font-size: 25px;
    }
    .table-container {
        border-radius: 20px;
    }
    .t {
        background-color: rgba(2, 20, 9, 0.5);
    }
    a, .d {
        color: cornsilk;
    }
    table {
        text-align: center;
    }
</style>
</head>
<body class="container-fluid" style="background-image: url('Images/iStock-1051616786-2048x1365.jpg'); background-repeat: no-repeat; background-size: cover; border-radius: 20px;">

<%
    // Retrieve the user from the session
    String user = (String) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("Login.html");
        return;
    }

    // Retrieve the cart from the session or create a new one if it doesn't exist
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

    // Add the new product to the cart if all details are present
    String productName = request.getParameter("product_name");
    String productValue = request.getParameter("product_value");
    String categories = request.getParameter("categories");
    String images = request.getParameter("image");
    
    if (productName != null && productValue != null && categories != null && images != null) {
        boolean found = false;
        for (Map<String, Object> product : cart) {
            if (productName.equals(product.get("Product_Name"))) {
                product.put("Quantity", (int) product.get("Quantity") + 1);
                found = true;
                break;
            }
        }
        if (!found) {
            Map<String, Object> product = new HashMap<>();
            product.put("Product_Name", productName);
            product.put("Product_Value", productValue);
            product.put("Categories", categories);
            product.put("Image", images);
            product.put("Quantity", 1);
            cart.add(product);
        }
    }

    // Calculate the total price of the cart
    double totalPrice = 0.0;
    for (Map<String, Object> product : cart) {
        double value = Double.parseDouble(product.get("Product_Value").toString().replace("$", ""));
        int quantity = (int) product.get("Quantity");
        totalPrice += value * quantity;
    }

    // Get the number of items in the cart
    int cartSize = cart.size();
%>

<ol class="navbar">
    <li class="nav-item nav-link ms-3"><a href="Options.jsp" class="text-decoration-none">Ecommerce-cart</a></li>
    <div class="nav">
        <li class="nav-item nav-link"><a href="Options.jsp" class="text-decoration-none">Home</a></li>
        <li class="nav-item nav-link">
            <a href="Cart.jsp" class="text-decoration-none">Cart<span class="badge bg-danger"><%= cartSize %></span></a>
        </li>
        <li class="nav-item nav-link"><a href="Order.jsp" class="text-decoration-none">Orders</a></li>
        <li class="nav-item nav-link"><a href="Logout" class="text-decoration-none">Logout</a></li>
    </div>
</ol>

<div class="ms-4 mt-3 table-container" style="background-color: rgba(2, 20, 9, 0.5);">
    <table class="table" style="background-color: rgba(2, 20, 9, 0.5);">
        <thead>
            <tr>
                <td>Image</td>
                <td scope="col" style="width:20%;">Name</td>
                <td scope="col" style="width:20%;">Category</td>
                <td scope="col" style="width:20%;">Price</td>
                <td scope="col" style="width:15%;">Quantity</td>
            </tr>
        </thead>
        <tbody class="t">
             <%
                if (cart != null) {
                    for (Map<String, Object> product : cart) {
                        double unitPrice = Double.parseDouble(product.get("Product_Value").toString().replace("$", ""));
                        int quantity = (int) product.get("Quantity");
                        double totalProductPrice = unitPrice * quantity;
            %>
           <tr>
                <td><img src="<%= product.get("Image") %>" class="img" style="width:100px; height:100px; border-radius: 2px;"></td>
                <td style="vertical-align: middle;" class="centered-text"><%= product.get("Product_Name") %></td>
                <td style="vertical-align: middle;"><%= product.get("Categories") %></td>
                <td style="vertical-align: middle;"><%= product.get("Product_Value") %></td>
                <td style="vertical-align: middle;"><%= product.get("Quantity") %></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
