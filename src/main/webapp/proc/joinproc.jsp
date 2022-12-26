<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="Dto.MemberDto" />
<jsp:setProperty property="*" name="dto"/>

<%@page import="Dao.MemberDao" %>
<%
	System.out.println("[MEMBERDTO] : " + dto);
	MemberDao dao = new MemberDao();
	boolean isok = dao.Insert(dto);
	if(isok){
		//INSERT 성공
		%>
			<script>
				alert("회원 등록이 완료되었습니다!");
				location.href="../index.jsp";
			</script>
		<%
	}
	else
	{
		//INSERT 실패
		%>
			<script>
				alert("회원 등록을 실패하였습니다!");
				location.href="../memberjoin.jsp";
			</script>
		<%
	}
%>



</body>
</html>