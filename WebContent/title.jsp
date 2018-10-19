<%@page import="java.sql.ResultSetMetaData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="post.PostInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제목없음</title>
</head>
<body>

<jsp:useBean id = "data" class="post.DataManager" scope="page" />
<%
try {
	int numb = (Integer) session.getAttribute("numb");//numb이 null로 들어움 getAttribute를 사용하는게 아닌 것 같음. 오브젝트를 불러와서 Integer으로 형변환 하는게 아닌가??
	String rPath = request.getContextPath();
	int total = data.countPost();
	if (numb != 0) {
		PostInfo post = data.getPost(numb);
		out.print("<table>");
		for (int i=1; i<total+1; i++){ //총 게시글 갯수를 구해(DataMannager에서 countPost 만들기!) 폴문으로 돌리도록
			out.print("<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>");
			out.print("<tr><td>"+post.getNumb()+"</td>");
			out.print("<td>"+post.getText()+"</td>");
			out.print("<td>"+post.getWriter()+"</td>");
			out.print("<td>"+post.getCd_date()+"</td></tr>");
		}
		out.print("</table>");
	} else {
		out.print("메모가 없습니다.");
	}
} catch(ClassCastException e){
	out.print("오브젝트가 인터저가 아님<br>");
} catch(NullPointerException e) {
	out.print("오브젝트가 널<br>");  //본 페이지 실행시 이곳으로 빠짐. 프라이머리키를 가진 'int numb'를 불러올 줄 모르는 것 같다.
}
%>

<a href="newPost.jsp">새글쓰기</a>  <!--새글쓰기에서의 저장은 잘 된다. 데이터베이스에서 값을 불러오는 것 공부.-->

</body>
</html>