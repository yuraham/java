<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="member.MemberInfo" %>
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
	if (id != null) {
		MemberInfo member = data.getMember(id);
		out.print("<form action=\""+rPath+"/member_update.jsp\" method=\"post\">");
		out.print("<table>");
		out.print("<tr><th colspan=2>회원정보수정</th></tr>");
		out.print("<tr><td>아이디</td><td>"+member.getId()+"</td></tr>");
		out.print("<tr><td>비밀번호</td><td><input type=\"password\" name=\"pass\" value=\""+member.getPass()
			+"\"/></td></tr>");
		out.print("<tr><td>이름</td><td><input type=\"text\" name=\"name\" value=\""+member.getName()+"\"</td></tr>");
		out.print("<tr><td>전화번호</td><td>"+member.getNumb()+"</td></tr>");
		out.print("<tr><td>이메일</td><td><input type\"text\" name=\"email\" value=\""+member.getEmail()
			+"\"/></td></tr>");
		out.print("<tr><td>가입날짜</td><td>"+member.getDate()+"</td></tr>");
		out.print("<tr><td conspan=2><input type=\"submit\" value=\"저장\"/>");
		out.print("</table>");
		out.print("</form>");
	} else {
		response.sendRedirect(rPath+"/member_info.jsp");
	}
%>
<a href="<%=request.getContextPath()%>/member_info.jsp">돌아가기</a>
</body>
</html>