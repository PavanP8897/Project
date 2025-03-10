<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>
<!DOCTYPE html>
<html >
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>Home</title>
    
    <style>
        #background{
            position: fixed;
            z-index: -1;
            background-size: cover;

        }
        span{
            color:cornsilk;

        }

        .d{
            background: rgba(2, 20, 9, 0.5);
        }
        a{
            color: cornsilk;
        }

    </style>

</head>
<body class="container-fluid">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<video autoplay muted loop id="background">
    <source src="./Images/pexels_videos_4703 (1080p).mp4" src="video/mp4">

</video>

<%
    // Retrieve the session object
    HttpSession session1 = request.getSession();

    // Retrieve the cart from session
    List<String> cart = (List<String>) session1.getAttribute("cart");
    
    // Check if the cart is null and initialize it if necessary
    if (cart == null) {
        cart = new ArrayList<>();
        session1.setAttribute("cart", cart);
    }

    int cartSize = cart.size();
%>




<ol class="navbar">
    <li class="nav-item nav-link ms-3"><a href="Options.jsp" class="text-decoration-none" style="color: cornsilk;">Ecommerce-cart</a></li>
    <div class="nav">
        <li class="nav-item nav-link "><a href="Options.jsp" class=" text-decoration-none">Home</a></li>
        <li class="nav-item nav-link "><a href="Cart.jsp" class=" text-decoration-none">Cart<span class="badge bg-danger"><%=cartSize %></span></a></li>
        <li class="nav-item nav-link"><a href="Order.jsp" class=" text-decoration-none">Orders</a></li>
        
        <li class="nav-item nav-link"><a  href="Logout" class= "  text-decoration-none">Logout</a></li>
    </div>
</ol>


<div class="mt-4 ms-4 border border-2 border-top-0 border-end-0 border-start-0 border-light-subtle ">
    <span >All Products</span>
</div>

<div class="d-flex" >
    <!--First Pic-->
    
    <div style="width: 150px; height: 150px;" class="ms-4">
    <form method="post" action="Cart.jsp">
    <input type="hidden" name="product_name" value="New Arrival Watches">
    <input type="hidden" name="product_value" value="$120.0">
    <input type="hidden" name="categories" value="Accessories">
    <input type="hidden" name="image" value="./Images/1-Best-Watch-Brands.webp">
        <div class="ms-2 mt-4" >
            <img src="./Images/1-Best-Watch-Brands.webp" class="border border-0 rounded-1" style="width: 250px; height: 210px;">
        </div>
        <div class="ms-2  rounded-1 d" style="width: 250px; height: 130px; " >
            <span class="mt-4 ms-2 fw-bold">New Arrival Watches</span><br>
            <span class="mt-4 ms-2">Price:&dollar; 120.0</span><br>
            <span class="mt-4 ms-2">Accessories</span><br>
            <button type="Submit" class="btn btn-dark ms-2 mt-2" >Add To Cart</button>
            <a href="Order.jsp" class="btn btn-info mt-2 ms-4">Buy Now</a>
    </form>
        </div>
    </div>


    <!--Second Pic -->
    <div style="width: 150px; height:150px; margin-left:230px;" >
    	<form method="post" action="Cart.jsp">
    <input type="hidden" name="product_name" value="New White Dress">
    <input type="hidden" name="product_value" value="$125.0">
    <input type="hidden" name="categories" value="Fashion">
    <input type="hidden" name="image" value="./Images/R.jpeg">
        <div class="ms-2 mt-4" >
            <img src="./Images/R.jpeg" class="border border-0 rounded-1" style="width: 250px; height: 210px;">
        </div>
        <div class="ms-2 rounded-1 d " style="width: 250px; height: 130px; ">
            <span class="mt-4 ms-2 fw-bold">New Dress</span><br>
            <span class="mt-4 ms-2">Price:&dollar; 125.0</span><br>
            <span class="mt-4 ms-2">Fashion</span><br>
            <button type="submit" class="btn btn-dark ms-2 mt-2" >Add To Cart</button>
            <a href="Order.jsp" class="btn btn-info mt-2 ms-4">Buy Now</a>
            </form>
        </div>
    </div>

    <!--Third Pic-->
    <div style="width: 150px; height: 150px; margin-left: 230px;" >
    <form method="post" action="Cart.jsp">
    <input type="hidden" name="product_name" value="Shirt And Scarf">
    <input type="hidden" name="product_value" value="$50.0">
    <input type="hidden" name="categories" value="Fashion">
    <input type="hidden" name="image" value="./Images/Man-Shopping.jpg">
        <div class="ms-2 mt-4" >
            <img src="./Images/Man-Shopping.jpg" class="border border-0 rounded-1" style="width: 250px; height: 210px;">
        </div>
        <div class="ms-2 rounded-1 d " style="width: 250px; height: 130px; ">
            <span class="mt-4 ms-2 fw-bold">Shirt and Scarf</span><br>
            <span class="mt-4 ms-2">Price:&dollar; 50.0</span><br>
            <span class="mt-4 ms-2">Fashion</span><br>
            <button  type="submit" class="btn btn-dark ms-2 mt-2" >Add To Cart</button>
            <a href="Order.jsp" class="btn btn-info mt-2 ms-4">Buy Now</a>
            </form>
        </div>
    </div>

    <!--Fourth Pic-->
    <div style="width: 150px; height: 150px; margin-left: 230px;" >
    <form method="post" action="Cart.jsp">
    <input type="hidden" name="product_name" value="Full Dress Combo">
    <input type="hidden" name="product_value" value="$100.0">
    <input type="hidden" name="categories" value="Fashion">
    <input type="hidden" name="image" value="./Images/fashion-online-shopping-sites.jpg">
        <div class="ms-2 mt-4" >
            <img src="./Images/fashion-online-shopping-sites.jpg" class="border border-0 rounded-1" style="width: 250px; height: 210px;">
        </div>
        <div class="ms-2 rounded-1 d " style="width: 250px; height: 130px; ">
            <span class="mt-4 ms-2 fw-bold">Dress</span><br>
            <span class="mt-4 ms-2">Price:&dollar; 100.0</span><br>
            <span class="mt-4 ms-2">Fashion</span><br>
            <button type="Submit" class="btn btn-dark ms-2 mt-2" >Add To Cart</button>
            <a href="Order.jsp" class="btn btn-info mt-2 ms-4">Buy Now</a>
            </form>
        </div>
    </div>
</div>

<!--2nd Row-->

<div class="d-flex">

    <!--1st-->

    <div style="width: 150px; height: 150px; margin-left: 24px; margin-top: 280px;" >
    <form method="post" action="Cart.jsp">
    <input type="hidden" name="product_name" value="Party Dress">
    <input type="hidden" name="product_value" value="$90.0">
    <input type="hidden" name="categories" value="Fashion">
    <input type="hidden" name="image" value="./Images/OIP.jpeg">
        <div class="ms-2 mt-4" >
            <img src="./Images/OIP.jpeg" class="border border-0 rounded-1" style="width: 250px; height: 210px;">
        </div>
       <div class="ms-2 rounded-1  d" style="width: 250px; height: 130px; ">
            <span class="mt-4 ms-2 fw-bold">Party Dress</span><br>
            <span class="mt-4 ms-2">Price:&dollar; 90.0</span><br>
            <span class="mt-4 ms-2">Fashion</span><br>
            <button type="Submit" class="btn btn-dark ms-2 mt-2" >Add To Cart</button>
            <a href="Order.jsp" class="btn btn-info mt-2 ms-4">Buy Now</a>
</form>
        </div>
    </div>

    <!--2nd-->

    <div style="width: 150px; height: 150px; margin-left: 230px; margin-top: 280px;" >
    <form method="post" action="Cart.jsp">
    <input type="hidden" name="product_name" value="Party Wear">
    <input type="hidden" name="product_value" value="$110.0">
    <input type="hidden" name="categories" value="F&Jewel">
    <input type="hidden" name="image" value="./Images/OIP (2).jpeg">
        <div class="ms-2 mt-4" >
            <img src="./Images/OIP (2).jpeg" class="border border-0 rounded-1" style="width: 250px; height: 210px;">
        </div>
        <div class="ms-2 rounded-1 d " style="width: 250px; height: 130px; ">
            <span class="mt-4 ms-2 fw-bold">Party Wear</span><br>
            <span class="mt-4 ms-2">Price:&dollar; 110.0</span><br>
            <span class="mt-4 ms-2">F&Jewel</span><br>
            <button type="submit" class="btn btn-dark ms-2 mt-2" >Add To Cart</button>
            <a href="Order.jsp" class="btn btn-info mt-2 ms-4">Buy Now</a>
            </form>
        </div>
    </div>

    <!--3rd-->

    <div style="width: 150px; height: 150px; margin-left: 230px; margin-top: 280px;" >
    <form method="post" action="Cart.jsp">
    <input type="hidden" name="product_name" value="Western Wear">
    <input type="hidden" name="product_value" value="$120.0">
    <input type="hidden" name="categories" value="Fashion">
    <input type="hidden" name="image" value="./Images/OIP (1).jpeg">
    
        <div class="ms-2 mt-4" >
            <img src="./Images/OIP (1).jpeg" class="border border-0 rounded-1" style="width: 250px; height: 210px;">
        </div>
        <div class="ms-2 rounded-1 d " style="width: 250px; height: 130px; ">
            <span class="mt-4 ms-2 fw-bold">Western Wear</span><br>
            <span class="mt-4 ms-2">Price:&dollar; 120.0</span><br>
            <span class="mt-4 ms-2">Fashion</span><br>
            <button type="submit" class="btn btn-dark ms-2 mt-2" >Add To Cart</button>
            <a href="Order.jsp" class="btn btn-info mt-2 ms-4">Buy Now</a>
            </form>
        </div>
    </div>

    <!--4th-->

    <div style="width: 150px; height: 150px; margin-left: 230px; margin-top: 280px;" >
    <form method="post" action="Cart.jsp">
    <input type="hidden" name="product_name" value="Western Clothing">
    <input type="hidden" name="product_value" value="$120.0">
    <input type="hidden" name="categories" value="Fashion">
    <input type="hidden" name="image" value="./Images/42269c67-cff0-4b4b-ae20-2d70a6292e861532412625763-GERUA-Women-Dresses-6061532412625603-1.webp">
        <div class="ms-2 mt-4" style="">
            <img src="./Images/42269c67-cff0-4b4b-ae20-2d70a6292e861532412625763-GERUA-Women-Dresses-6061532412625603-1.webp" class="border border-0 rounded-1" style="width: 250px; height: 210px;">
        </div>
        <div class="ms-2 rounded-1 d " style="width: 250px; height: 130px; ">
            <span class="mt-4 ms-2 fw-bold">Western Clothing</span><br>
            <span class="mt-4 ms-2">Price:&dollar; 120.0</span><br>
            <span class="mt-4 ms-2">Fashion</span><br>
            <button type="submit" class="btn btn-dark ms-2 mt-2" >Add To Cart</button>
            <a href="Order.jsp" class="btn btn-info mt-2 ms-4">Buy Now</a>
            </form>
        </div>
    </div>
</div>

</body>

</html>
    