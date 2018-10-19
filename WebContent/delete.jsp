<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제목없음</title>
</head>
<body>
	<jsp:useBean id="data" class="post.DataManager" scope="page" />
	<% 
		String title = (String) session.getAttribute("Title");
		String rPath = request.getContextPath();
		if (title != null) {
			if (data.removePost(title) != 0) {
				out.print("<h3>게시글을 삭제했습니다.</h3>");
				session.invalidate();
				out.print("<h3><a href=\""+rPath+"/newPost.jsp\")새글쓰기</a></h3>");
			} else {
				out.print("<h3>게시글을 삭제하지 못했습니다.</h3>");
				out.print("<h3><a href=\""+rPath+"/register.jsp\"돌아가기</a></h3>");
			}
		}
	%>
	
</body>
</html>
