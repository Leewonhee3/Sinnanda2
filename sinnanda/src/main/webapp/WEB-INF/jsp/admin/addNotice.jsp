<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="../width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- plugins:css -->	
	<link rel="stylesheet" href="../skydash/vendors/feather/feather.css">
	<link rel="stylesheet" href="../skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" href="../skydash/vendors/css/vendor.bundle.base.css">
	
	<!-- endinject -->
	<!-- Plugin css for this page -->
	<link rel="stylesheet" href="../skydash/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
	<link rel="stylesheet" href="../skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="../skydash/js/select.dataTables.min.css">
	
	<!-- End plugin css for this page -->
	
	<!-- inject:css -->
	<link rel="stylesheet" href="../skydash/css/vertical-layout-light/style.css">
	<link rel="shortcut icon" href="../skydash/images/favicon.png" />
	
	<title>공지사항 페이지</title>
</head>
<script>
		// 게시판폼, 게시판으로 자동 스크롤
		function toBoardScroll(){
			var offset = $("#startBoard").offset();
			$('html, body').animate({scrollTop: offset.top}, 200);
		}
	</script>
<body>
	<div class="container-scroller">
	
		<!-- [이승준] 호스트 페이지 상단 내비바 - START -->
		<%@ include file="/WEB-INF/partials/myPageNavbar.jsp" %>
		<!-- [이승준] 호스트 페이지 상단 내비바 - END -->
	
	    <!-- [이승준] 호스트 페이지 본문 - START -->
		<div class="container-fluid page-body-wrapper">
		
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - START -->
			<%@ include file="/WEB-INF/partials/adminPageSidebar.jsp" %>
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - END -->
			
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- 내용1 -->
					<div class="row" style="height: 100%;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<span class="subheading" style="margin-left: 10px;">공지사항 등록</span>
									<h1 style="margin-top: 10px;"><strong>공지사항 등록</strong></h1>
									
								    <div class="container">
										<form id="addNoticeForm" action="addNotice" method="post">
										<input id="adminNo" name="adminNo" type="hidden" value="${loginUser.admin.adminNo}">
										<table class="table table-myPage" style="width: 100%;">
											<tr>
												<th style="width: 100px; font-size: 20px; text-align:center;">제목</th>
												<td style="font-size: 20px;"><input id="noticeTitle" name="noticeTitle" type="text"></td>
											</tr>
											<tr>
												<th style="text-align:center;">상단 고정</th>
												<td>
													<select id="noticePin" name="noticePin">
														<option value="no">No</option>
														<option value="yes">Yes</option>
													</select>
												</td>
											</tr>
											<tr>
												<th style="text-align:center;">공지 유형</th>
												<td>
													<select id="noticeCategory" name="noticeCategory">
														<option value="기타" selected>기타</option>
														<option value="정보">정보</option>
														<option value="시스템">시스템</option>
														<option value="이벤트">이벤트</option>
														<option value="뉴스">뉴스</option>
													</select>
												</td>
											</tr>
											<tr>
												<th style="padding-top: 150px;padding-bottom: 150px;" width="10%">내용</th>
												<td><textarea id="noticeContent" name="noticeContent" cols="130" rows="11">${notice.noticeContent}</textarea></td>
											</tr>
										</table>
										<button class="btn btn-primary" type="submit" style="float: right; margin-top: auto;">공지 등록</button>
										
						
								</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- [이승준] 하단 Footer - SATRT -->
	<%@ include file="/WEB-INF/partials/myPageFooter.jsp" %>
	<!-- [이승준] 하단 Footer - END -->


	<!-- plugins:js -->
  <script src="../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="../vendors/chart.js/Chart.min.js"></script>
  <script src="../vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="../vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="../js/dataTables.select.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../js/off-canvas.js"></script>
  <script src="../js/hoverable-collapse.js"></script>
  <script src="../js/template.js"></script>
  <script src="../js/settings.js"></script>
  <script src="../js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="../js/dashboard.js"></script>
  <script src="../js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
</body>
</html>