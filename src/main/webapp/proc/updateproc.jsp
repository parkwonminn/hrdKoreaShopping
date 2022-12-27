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
	 
	MemberDao dao = new MemberDao();
	boolean isok = dao.Update(dto);
	if(isok){
		//UPDATE 성공
		%>
			<script>
				alert("회원 수정이 완료되었습니다!");
				location.href="../index.jsp";
			</script>
		<%
	}
	else
	{
		//INSERT 실패
		%>
			<script>
				alert("회원 수정을 실패하였습니다!");
				location.href="../memberinfo.jsp";
			</script>
		<%
	}
%>



</body>
</html>