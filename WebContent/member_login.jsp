<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제목없음</title>
</head>
<body>
<jsp:useBean id="data" class="member.MemberData" scope="page" />
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String rPath = request.getContextPath();
	if (data.isMember(id, pass)) {
		session.setAttribute("ID", id);
		response.sendRedirect(rPath+"/member_info.jsp");
	} else {
		response.sendRedirect(rPath+"/index.jsp");
	}
%>
</body>
</html>