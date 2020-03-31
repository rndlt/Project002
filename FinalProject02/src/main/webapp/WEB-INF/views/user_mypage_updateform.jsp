<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<style type="text/css">
.input {
	border: 1px solid black;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp"%>

	<div align="center">
		<img src="resources/file/profilePhoto/${loginInfo.userId}.png" />
		<form action="">
		
		</form>
		<table>
			<tr>
				<td>아이디</td>
				<td>${loginInfo.userId }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" class="input"value="${loginInfo.userName }" /></td>
			</tr>

			<tr>
				<td>전화번호</td>
				<td><input type="text" class="input"value="${loginInfo.userPhone }" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><!-- 도로명 주소 검색하기 -->
		<div id="register_addrBox">
				<input id="registerAddr" type="text" value="" onclick="openPop_juso();" required="required" name="addr1" >
				<input id="registerAddr1" type="text" value="" required="required" name="addr2" > 
		</div></td>
			</tr>

		</table>
	</div>



	<%@ include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>