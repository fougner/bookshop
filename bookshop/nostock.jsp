<%@page contentType="text/html" pageEncoding="UTF-8" import="beans.*, tags.*" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="bookshop" uri="/bookshop"%>

 <%@include file='header.html'%>

    <div class="container">
    	<div class="alert alert-error">
    		<h1>Not enough stock!</h1>
		</div>

		 <a href="shop" class="btn btn-primary btn-large">Go back</a>

    </div> <!-- /container -->
<%@include file='footer.html'%>
