<%@page contentType="text/html" pageEncoding="UTF-8" import="beans.*, tags.*" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@taglib prefix="bookshop" uri="/bookshop"%>

<%@include file='header.html'%>

<div class="container">

<jsp:useBean id="bookList" class="beans.BookListBean" scope="application">
    Error, the bean should have been created in the servlet!
</jsp:useBean>


<c:set var="booklist_xslt">
   <c:import url="booklist_xslt.xsl"/>
</c:set> 

<x:transform xslt="${booklist_xslt}">
    <jsp:getProperty name="bookList" property="xml"/>
</x:transform>



<c:set var="shoppingcart_xslt">
   <c:import url="shoppingcart_xslt.xsl"/>
</c:set> 
<x:transform xslt="${shoppingcart_xslt}">
   <bookshop:shoppingcart/>
</x:transform>

<c:if test="${sessionScope.currentUser != null}">
  <form action=shop?action=profile method=post>
    <input type="submit" value="Update Profile">
  </form>

  <form action=shop?action=logout method=post>
    <input type="submit" value="Logout">
  </form>
</c:if>

</div> <!-- /container -->
<%@include file='footer.html'%>