<!DOCTYPE html>
<html>
<head><title>BookShop::Shop</title>
<link rel="stylesheet" type="text/css" href="bootstrap.min.css" />
<style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
    </style>
</head>
<body>
<div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">Shoppr</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li ${(param.page=="index") ? 'class="active"':''}><a href="/bookshop">Home</a></li>
              <li ${(param.page=="shop") ? 'class="active"':''}><a href="/bookshop/shop">Shop</a></li>
              <li ${(param.page=="checkout") ? 'class="active"':''}><a href="/bookshop/shop?action=checkout">Checkout</a></li>
            </ul>

            <ul class="nav pull-right">
            <li class="divider-vertical"></li>
            
            ${(sessionScope.currentUser != null) ?
              '<li><a href="/bookshop/shop?action=profile">Profile</a></li>
              <li><a href="/bookshop/shop?action=logout">Logout</a></li>' : ''}
              ${(sessionScope.currentUser == "admin") ?
              '<li class="divider-vertical"></li>
              <li><a href="/bookshop/admin">Admin</a></li>' : ''}
            </ul>

          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

