<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제목없음</title>
</head>
<body>
<jsp:useBean id="member" class="member.MemberInfo" scope="page"/>
<jsp:setProperty name="member" property="*"/>
<jsp:useBean id="data" class="member.MemberData" scope="page"/>

<%
	String rpath = request.getContextPath();
	if(!data.isMember(member.getId(), member.getPass())) {
		if(data.insertMember(member) != 0) {
			out.print("<h3>회원가입에 성공하였습니다.</	h3>");
			out.print("<h3><a href=\""+rpath+"/index.jsp</a></h3>");
		} else {
			out.print("<h3>회원가입에 실패하였습니다. 잠시 후 다시 시도해주세요.");
			out.print("<h3><a href=\""+rpath+"/index.jsp</a></h3>");
		}
	} else {
		out.print("<script>alert('이미 가입된 아이디입니다. 다시 작성해 주세요.')</script>");
	}
	
%>
</body>
</html>