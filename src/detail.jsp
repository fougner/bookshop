<%@page contentType="text/html" pageEncoding="UTF-8" import="beans.*, tags.*" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="bookshop" uri="/bookshop"%>

<%@include file='header.html'%>

	<div class="container">

<jsp:useBean id="book" class="beans.BookBean" scope="request">
    Error, the bean should have been created in the servlet!
</jsp:useBean>


<c:set var="bookdetail_xslt">
   <c:import url="bookdetail_xslt.xsl"/>
</c:set> 

<x:transform xslt="${bookdetail_xslt}">
    <detailpage>
      <jsp:getProperty name="book" property="xml"/>
    </detailpage>
</x:transform> 

    </div> <!-- /container -->
<%@include file='footer.html'%>