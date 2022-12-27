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


	<%@page import="Dto.*,Dao.*,java.util.*,java.text.*"%>
	<%
	int custno = Integer.parseInt(request.getParameter("custno"));
	MemberDao dao = new MemberDao();
	MemberDto dto =  dao.Select(custno);
	
	SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
	Date date = fmt.parse(dto.getJoindate());
	
	%>

	<section>
		<h2>홈쇼핑 회원 정보 수정</h2>

		<form action="proc/updateproc.jsp" method="post" >
			<table align=center>
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno"  value="<%=dto.getCustno() %>" /></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" value="<%=dto.getCustname() %>" /></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" value="<%=dto.getPhone() %>" /></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" value="<%=dto.getAddress() %>" /></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" value="<%=fmt.format(date) %>" /></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원])</td>
					<td><input type="text" name="grade" value="<%=dto.getGrade() %>" /></td>
				</tr>
				<tr>
					<td>거주도시</td>
					<td><input type="text" name="city" value="<%=dto.getCity() %>" /></td>
				</tr>
				<tr>
					<td colspan=2>
						<button onclick="isValid()">등록</button>
						<button>조회</button>
					</td>
				</tr>
			</table>
		</form>

	</section>
	<footer> HRDKOREA Copyright@2016 ALL - </footer>

	
	<script>
		function isValid(){
			const frm = document.joinfrm; //form연결
			
			if(frm.custname.value.trim()==""){
				alert("회원 성명이 입력되지 않았습니다!");
				frm.custname.focus();
				return false;
			}
			if(frm.phone.value.trim()==""){
				alert("회원 전화번호가 입력되지 않았습니다!");
				frm.phone.focus();
				return false;
			}
			if(frm.address.value.trim()==""){
				alert("회원 주소가 입력되지 않았습니다!");
				frm.address.focus();
				return false;
			}
			if(frm.grade.value.trim()==""){
				alert("고객 등급이 입력되지 않았습니다!");
				frm.grade.focus();
				return false;
			}
			if(frm.city.value.trim()==""){
				alert("도서 코드가 입력되지 않았습니다!");
				frm.city.focus();
				return false;
			}
			
			//문제 없을경우 
			//frm.action="proc/joinproc.jsp";
			frm.submit();
		}
	</script>



</body>
</html>