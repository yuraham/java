<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제목없음</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<form action="<%=request.getContextPath()%>/register.jsp">
		<div class="form-group">
		<label for="text"></label>
		<textarea class="form-control" rows="5" id="text"></textarea>
		</div>
		<div class="form-group">
			<label for="writer">작성자:</label>
			<input type="text" class="form-control" id="writer">
		</div>
		<input type="submit" value="저장" class="btn btn-outline-dark"/>
	</form>
</div>
</body>
</html>