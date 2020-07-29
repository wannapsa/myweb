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

	<!--
	<spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
	 -->
	<c:url value="/css/main.css" var="jstlCss" />
	<link href="${jstlCss}" rel="stylesheet" />

</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Spring Boot</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="query">Query</a></li>
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
						<th>Username</th>
						<th>Name</th>
						<th>Age</th>
						<th>Bird Date</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.username}</td>
							<td>${item.first_name}${item.last_name}</td>
							<td>${item.age}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${item.date_bird}" />
							<td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>

	<script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>