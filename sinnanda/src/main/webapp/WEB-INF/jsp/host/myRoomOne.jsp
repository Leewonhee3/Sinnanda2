<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
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
	
	<title>사업자 객실 페이지</title>
</head>

<body>
	
	<div class="container-scroller">
	
		<!-- [이승준] 호스트 페이지 상단 내비바 - START -->
		<%@ include file="/WEB-INF/partials/myPageNavbar.jsp" %>
		<!-- [이승준] 호스트 페이지 상단 내비바 - END -->
	
	    <!-- [이승준] 호스트 페이지 본문 - START -->
		<div class="container-fluid page-body-wrapper">
		
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - START -->
			<%@ include file="/WEB-INF/partials/hostPageSidebar.jsp" %>
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - END -->
			
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row" style="height: 100%;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<span class="subheading" style="margin-left: 10px;">
										<a href="hostPage?hostNo=${loginUser.host.hostNo}">메인</a> > 
										<a href="myAccomList">숙소 목록</a> > 
										<a href="myAccomOne?accomNo=${room.accomNo}">숙소 상세</a> > 
										객실 상세
									</span>
									
									<h1 style="margin-top: 10px;"><strong>사업자 숙소 상세보기</strong></h1>
									
									<div class="container">
										<h2 style="margin: 20px;"><strong>객실 정보</strong></h2>
										
										<table class="table table-myPage">
											<tr>
												<th style="width: 15%;">객실 번호</th>
												<td>${room.roomNo}</td>
											</tr>
											<tr>
												<th>이름</th>
												<td>${room.roomName}</td>
											</tr>
											<tr>
												<th>숙소 번호/이름</th>
												<td>${room.accomNo}&nbsp;/&nbsp;${room.accom.accomName}</td>
											</tr>
											<tr>
												<th>객실 메인 이미지</th>
												<td>${room.roomMainImg}</td>
											</tr>
											<tr>
												<th>설명</th>
												<td>${room.roomDescription}</td>
											</tr>
											<tr>
												<th>인원</th>
												<td>${room.roomPerson}</td>
											</tr>
											<tr>
												<th>가격</th>
												<td>${room.roomPrice}</td>
											</tr>
											<tr>
												<th>체크인</th>
												<td>${room.roomCheckIn}</td>
											</tr>
											<tr>
												<th>체크아웃</th>
												<td>${room.roomCheckOut}</td>
											</tr>
											<tr>
												<th>대여여부</th>
												<td>${room.roomUse}</td>
											</tr>
											<tr>
												<th>등록일</th>
												<td>${room.createDate}</td>
											</tr>
											<tr>
												<th>비품</th>
												<td>
													<c:if test="${not empty room.roomItemInven}">
														<c:forEach items="${room.roomItemInven}" var="roomItems">
															<img src="${pageContext.request.contextPath}/images/roomItem/${roomItems.roomItem.roomItemImg}" style="border-radius:0px;">
															${roomItems.roomItem.roomItemName}
															${roomItems.roomItemCount}개&nbsp;&nbsp;
														</c:forEach>
													</c:if>
													<c:if test="${empty room.roomItemInven}">
														비품 없음
													</c:if>
												</td>
											</tr>
											<tr>
												<th>이미지</th>
												<td>
													<table>
														<tr>
															<c:if test="${not empty room.roomImg}">
																<c:forEach items="${room.roomImg}" var="roomImgs">
																	<c:set var="i" value="${i+1}"/>
																	<td>
																		<div><img src="${pageContext.request.contextPath}/images/room/${roomImgs.roomImgFile}" style="width: 150px; height: 150px; border-radius:0px;"></div>
																		<div>No.${roomImgs.roomImgNo}</div>
																	</td>
																	<c:if test="${i > 2}">
																		<c:set var="i" value="0"/>
																		<tr></tr>
																	</c:if>
																</c:forEach>
															</c:if>
															<c:if test="${empty room.roomImg}">
																이미지 없음
															</c:if>
														</tr>
													</table>
												</td>
											</tr>
										</table>
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
	<%@ include file="/WEB-INF/partials/footer.jsp" %>
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
</body>
</html>