<%@page contentType="text/html" pageEncoding="UTF-8" import="beans.*, tags.*" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="bookshop" uri="/bookshop"%>

<%@include file='header.html'%>

<div class="container">

<jsp:useBean id="bookList" class="beans.ProductListBean" scope="application">
    Error, the bean should have been created in the servlet!
</jsp:useBean>


<c:set var="booklist_xslt">
   <c:import url="booklist_xslt.xsl"/>
</c:set> 

<div class="row">

<x:transform xslt="${booklist_xslt}">
    <jsp:getProperty name="bookList" property="xml"/>
</x:transform>

</div>


<c:set var="shoppingcart_xslt">
   <c:import url="shoppingcart_xslt.xsl"/>
</c:set> 

<div class="row">
<x:transform xslt="${shoppingcart_xslt}">
   <bookshop:shoppingcart/>
</x:transform>
</div>

</div> <!-- /container -->
<%@include file='footer.html'%>