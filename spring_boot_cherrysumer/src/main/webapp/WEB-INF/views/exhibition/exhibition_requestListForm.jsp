<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>전시회 신청 관리자 페이지</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/header.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/bottom.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/exhibition_requestList.css'/>">
		<script src="<c:url value='/js/jquery-3.6.1.min.js'/>"></script>
		<script src="<c:url value='/js/exhibition_requestConfirm.js'/>"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/top.jsp"/>
		<div id= "wrap">
			<h2>전시회 신청 관리자 페이지</h2>
				
			<form id="exhAdminConfirm" method="post">
			<!-- action="/exhibition/adminConfirm" -->
				<div id="tableBackground">
					<table border="1">
						<tr>
							<td rowspan="2">신청 번호</td><td rowspan="2">작가 이름</td><td rowspan="2">회원 ID</td><td rowspan="2">전시회 제목</td><td colspan="2">전시일</td><td rowspan="2">승인 여부</td><td rowspan="2">미리보기</td>
						</tr>
						<tr>
							<td>시작일</td><td>종료일</td>
						</tr>
						<c:forEach var="exhb" items="${exhList }">
							<tr>
								<td>${exhb.exhNo}</td>
								<td>${exhb.memId }</td>
								<td>${exhb.memName }</td>
								<td>${exhb.exhTitle_kr}</td>
								<td><fmt:formatDate var="date" value="${exhb.exhStartDate }" pattern="yyyy. MM. dd" /> ${date }</td>
								<td><fmt:formatDate var="date" value="${exhb.exhEndDate }" pattern="yyyy. MM. dd" /> ${date }</td>
								<td><select id="exhConfirm" name="exhConfirm" style="text-align:center;">
						       			<option value="" selected></option>
						        		<option value="1"> 미승인 </option>
						        		<option value="2"> 승인 </option>
						        		<option value="3"> 대표 이미지 </option>
						        	</select>
						        </td>
								<td></td>
							</tr>
						</c:forEach>
					</table>
					<input type="submit" value="저장">				
				</div>
			</form>
			
	
			<form id="exhSearchFrm">
				<select id="type" name="type">
					<option value=""> 검색 조건 선택 </option>
					<option value="exhConfirm"> 관리자 승인 필요 </option>
				</select>
				<input type = "text" name = "keyword">
				<input type = "submit" value = "검색">
			</form>
			
			<!-- 검색 결과 출력 -->
			<div id="searchResultBox"></div>
		</div>
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>