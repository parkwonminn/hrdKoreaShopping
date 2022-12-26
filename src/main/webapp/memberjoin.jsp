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

section td {
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


	<%@page import="Dao.*,java.util.*"%>
	<%
	MemberDao dao = new MemberDao();
	int maxcustno = dao.maxcustno();
	
	Calendar cal = Calendar.getInstance();
	int year= cal.get(Calendar.YEAR);
	int month=cal.get(Calendar.MONTH)+1;
	int day = cal.get(Calendar.DATE);
	System.out.println(year+""+month+""+day);
	String date = year+""+month+""+day;
	%>

	<section>
		<h2>홈쇼핑 회원 등록</h2>

		<form action="proc/joinproc.jsp" method="post">
			<table align=center>
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value="<%=maxcustno + 1%>" /></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" /></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" /></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" value="<%=date%>" /></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원])</td>
					<td><input type="text" name="grade" /></td>
				</tr>
				<tr>
					<td>거주도시</td>
					<td><input type="text" name="city" /></td>
				</tr>
				<tr>
					<td colspan=2>
						<button>등록</button>
						<button>조회</button>
					</td>
				</tr>
			</table>
		</form>

	</section>
	<footer> HRDKOREA Copyright@2016 ALL - </footer>


</body>
</html>