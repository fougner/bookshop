<%@page contentType="text/html" pageEncoding="UTF-8" import="beans.*, tags.*" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="bookshop" uri="/bookshop"%>

 <%@include file='header.html'%>

    <div class="container">
    <div class="hero-unit">
        <h1>Welcome, admin!</h1>
        <br>
        <h2>Feel free to add products to the database</h2>
    </div>

    <jsp:useBean id="bookList" class="beans.ProductListBean" scope="application">
    	Error, the bean should have been created in the servlet!
	</jsp:useBean>

</div>

    </div> <!-- /container -->
<%@include file='footer.html'%>