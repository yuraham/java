<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
	request.setCharacterEncoding("utf-8");
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
	String id = (String) session.getAttribute("ID");
	String rPath = request.getContextPath();
	if(id != null){
		if (data.removeMember(id) != 0) {
			out.print("<h3>회원정보를 삭제했습니다.</h3>");
			session.invalidate();
			out.print("<h3><a href=\""+rPath+"/index.jsp\">로그인 화면으로</a></h3>");
		} else {
			out.print("<h3>회원정보를 삭제하지 못했습니다.</h3>");
			out.print("<h3><a href=\""+rPath+"/member_info.jsp\">회원정보로</a></h3>");
		}
	} else {
		out.print("<h3>로그인이 필요합니다.</h3>");
		response.sendRedirect(rPath+"/index.jsp");
	}
%>
</body>
</html>