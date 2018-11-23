<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제목없음</title>
</head>
<body>
	<jsp:useBean id="post" class="post.PostInfo" scope="page" />
	<jsp:setProperty name="post" property="*" />
	<jsp:useBean id="data" class="post.DataManager" scope="page" />
	<%
	String rPath = request.getContextPath();
	if(!data.isPost(post.getNumb())) {
		if(data.insertPost(post) != 0) {
			out.print("<h3>번호: "+post.getNumb()+"</h3>");
			out.print("<p>내용: "+post.getText()+"</br>");
			out.print("작성인: "+post.getWriter()+"</br>");
			out.print("날짜: "+post.getCd_date()+"</p>");
			out.print("<h4><a href=\""+rPath+"title.jsp\">메모 리스트로</a></h4>");
		} else {
			out.print("메모 등록에 실패했습니다.");
			out.print("<h4><a href=\""+rPath+"/newPost.jsp\">재등록</a></h4>");
			out.print("<h4><a href=\""+rPath+"/title.jsp\">메모 리스트로</a></h4>");
		}
	} else {
		out.print("중복된번호-에러");
	}
	%>

</body>
</html>
