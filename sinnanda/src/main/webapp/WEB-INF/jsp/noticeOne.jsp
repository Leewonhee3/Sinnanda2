<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">

<title>공지사항 상세조회</title>
</head>
<body onload="toBoardScroll()">

	<!-- 페이지 접근 시, 본문으로 이동해주는 JQuery -->
	<script>
		// 게시판폼, 게시판으로 자동 스크롤
		function toBoardScroll(){
			var offset = $("#startBoard").offset();
			$('html, body').animate({scrollTop: offset.top}, 200);
		}
	</script>
	
	<!-- [이승준] 상단 내비바 - START -->
	<%@ include file="/WEB-INF/partials/navbar.jsp" %>
	<!-- [이승준] 상단 내비바 - END -->
	
	<!-- [이승준] 상단 이미지 배너 - START -->
	<%@ include file="/WEB-INF/partials/noticeBackground.jsp" %>
	<!-- [이승준] 상단 이미지 배너 - END -->
    
    <!-- [김영후] 공지 상세보기 -->
	<section id="startBoard" class="ftco-section testimony-section bg-light">
		 <div class="container">
			<h1><strong>공지 상세보기</strong></h1>
						
			<table class="table table-board" style="width: 100%;">
				<tr>
					<th style="width: 100px; font-size: 20px; text-align:center;">제목</th>
					<td style="font-size: 20px;">${notice.noticeTitle}</td>
					<th style="width: 100px; padding-top: 20px; text-align:center;">공지유형</th>
					<td style="padding-top: 20px;">${notice.noticeCategory}</td>
				</tr>
				<tr>
					<th style="text-align:center;">작성자</th>
					<td style="width: 60%;">${notice.adminName}</td>
					<th style="width: 100px; text-align:center;">작성일</th>
					<td>
						<fmt:parseDate value="${notice.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
						<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
					</td>	
				</tr>
				<tr>
					<th style="padding-top: 150px;padding-bottom: 150px;" width="10%">내용</th>
					<td>${notice.noticeContent}</td>
				</tr>
			</table>
			
			
		</div>			
	</section>
	<!-- [김영후] 공지 상세보기 END -->	
	
	<!-- [이승준] 하단 Footer - SATRT -->
	<%@ include file="/WEB-INF/partials/footer.jsp" %>
	<!-- [이승준] 하단 Footer - END -->
	
	<!-- js 소스코드 -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="direngine-master/js/google-map.js"></script>
	<script src="direngine-master/js/main.js"></script>
</body>
</html>