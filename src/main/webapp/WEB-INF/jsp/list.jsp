<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
<head>

	<!-- Access the bootstrap Css like this,
		Spring boot will handle the resource mapping automcatically -->
	<link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<!--
	<spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
	 -->
	<c:url value="css/main.css" var="jstlCss" />
	<link href="${jstlCss}" rel="stylesheet" />


<script type="text/javascript">

function addToCart(id){
	
	$.ajax({
		  type: "POST",
		  url: '${contextPath}/addToCart',
		  data: {id: id},
		  success: function(data){	
			  if(data.indexOf('<!DOCTYPE html') == 0){
				  location.reload();
			  } else if(data.indexOf('Error::') == 0){
				  alert("Error");
			  } else {
				  alert('Success');
			  }
			  		
		  },
		  error: function (jqXHR, textStatus, errorThrown){
		 		alert('dd '+textStatus);
		  }
	});
	
}

</script>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Spring Boot</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="/">Catalog</a></li>
					<li><a href="cart">Cart</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container">

		<div class="starter-template">
			<h1>Query List</h1>

			<table class="table table-striped">

				<thead>
					<tr>
						<th>Product</th>
						<th>Description</th>
						<th>Price</th>
						
						<th></th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.name}</td>
							<td>${item.description}</td>
							<td>${item.price}</td>
							
							<td align="left">
								<button onclick="addToCart(${item.id})">AddToCart</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>

	<script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>