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
<jsp:useBean id="member" class="member.MemberInfo" scope="page" />
<jsp:setProperty property="*" name="member" />
<jsp:useBean id="data" class="member.MemberData" scope="page" />
<%
	String id = (String) session.getAttribute("ID");
	String rPath = request.getContextPath();
	if(id != null) {
		if (data.updateMember(member, id) != 0){
			response.sendRedirect(rPath+"/member_info.jsp");
		} else {
			out.print("<h3>회원정보 수정에 실패하였습니다.</h3>");
			out.print("<a href=\""+rPath+"/member_update_form.jsp\">다시 수정하기</a>");
			out.print("<a href=\""+rPath+"/member_info.jsp>되돌아가기</a>");
		}
	} else {
		response.sendRedirect(rPath+"/index.jsp");
	}
%>
</body>
</html>