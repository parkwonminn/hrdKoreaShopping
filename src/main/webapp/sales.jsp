<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<style>
header {
	text-align: center;
	height: 50px;
}

nav>ul {
	display: flex;
	justify-content: space-around;
}

section {
	height: 600px;
	text-align: center;
	margin-top: 100px;
}

section td,th {
	border: 1px solid;
}
</style>

	<header>
		<h1>쇼핑몰 회원관리 ver 1.0</h1>
	</header>
	<nav>
		<ul>
			<li><a href="memberjoin.jsp">회원등록</a></li>
			<li><a href="memberinfo.jsp">회원목록조회/수정</a></li>
			<li><a href="sales.jsp">회원매출조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>

	<%@page import="Dto.*,Dao.*,java.util.*"%>
	<%
	SalesDao dao = new SalesDao();
	List<SalesDto> list = dao.SelectAll();
	%>
	<section>
		<h2>회원 매출 조회</h2>
		<table align=center>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
			for (int i = 0; i < list.size(); i++) {
				out.println("<tr>");
				out.println("<td>" + list.get(i).getCustno() + "</td>");
				out.println("<td>" + list.get(i).getCustname() + "</td>");
				out.println("<td>" + list.get(i).getGrade() + "</td>");
				out.println("<td>" + list.get(i).getSales() + "</td>");
				out.println("</tr>");
			}
			%>
		</table>
	</section>
	<footer> HRDKOREA Copyright@2016 ALL - </footer>


</body>
</html>