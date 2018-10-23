<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
<jsp:useBean id="data" class="member.MemberData" scope="page"/>
<%
	String id = (String) session.getAttribute("ID");
	String rPath = request.getContextPath();
    if (id != null) {
        MemberInfo member = data.getMember(id);
        out.print("<table>");
        out.print("<tr><th colspan=2>회원정보</th></tr>");
        out.print("<tr><td>아이디</td><td>"+member.getId()+ "</td></tr>");
        out.print("<tr><td>이름</td><td>" + member.getName()+ "</td></tr>");
        out.print("<tr><td>전화번호</td><td>" + member.getNumb()+ "</td></tr>");
        out.print("<tr><td>이메일</td><td>" + member.getEmail()+ "</td></tr>");
        out.print("<tr><td>가입날짜</td><td>" + member.getDate()+ "</td></tr>");
        out.print("</table>");
    } else {
        response.sendRedirect(rPath+"/index.jsp");
    }
%>
<a href="<%=request.getContextPath()%>/member_update_form.jsp">회원정보수정</a>
<a href="<%=request.getContextPath()%>/member_logout.jsp">로그아웃</a>
<a href="<%=request.getContextPath()%>/member_delete.jsp">회원탈퇴</a>
<br />
</body>
</html>