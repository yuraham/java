<%@page import="post.PostInfo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>메모 리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
 .margin {
 	margin-top:30px;
 }
</style>
</head>
<body>

<div class="container">
	<table class="table margin">
		<thead class="thead-dark">
			<tr>
				<th>번호</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
		<jsp:useBean id = "data" class="post.DataManager" scope="page" />
		<%
		ArrayList<PostInfo> list = data.getList();
		for(int i=0; i<list.size(); i++){
		%>
		<tr>
			<td><%=list.get(i).getNumb() %></td>
			<td><%=list.get(i).getText() %></td>
			<td><%=list.get(i).getWriter() %></td>
			<td><%=list.get(i).getCd_date() %></td>
		</tr>
		<% } %>
		</tbody>
	</table>
	<a href="newPost.jsp" class="btn btn-outline-dark">새글쓰기</a>
</div>
</body>
</html>