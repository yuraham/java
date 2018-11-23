<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
</head>
<body>
<form action="member_register.jsp" method="post">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" class="id"/></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pass" class="pass"/></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="pass2" class="pass2"/></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="numb" class="numb"/></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" class="name"/></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" class="email"/></td>
	</tr>
	<tr>
		<td colspan=2><input type="submit" value="확인" /><input type="reset" value="취소"/></td>
	</tr>
</table>
</form>
</body>
</html>