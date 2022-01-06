<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- plugins:css -->
		<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/animate.css">
	
	<link rel="stylesheet" href="/skydash/vendors/feather/feather.css">
	<link rel="stylesheet" href="/skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" href="/skydash/vendors/css/vendor.bundle.base.css">
	<!-- endinject -->
	<!-- Plugin css for this page -->
	<link rel="stylesheet" href="/skydash/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
	<link rel="stylesheet" href="/skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="/skydash/js/select.dataTables.min.css">
	<!-- End plugin css for this page -->
	<!-- inject:css -->
	<link rel="stylesheet" href="/skydash/css/vertical-layout-light/style.css">
	<!-- endinject -->
	<link rel="shortcut icon" href="/skydash/images/favicon.png" />
	
	<title>지역별 방문 횟수 차트 페이지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js"></script>
</head>
<body>
	<div class="container-scroller">
	
		<!-- [이승준] 마이 페이지 상단 내비바 - START -->
		<%@ include file="/WEB-INF/partials/myPageNavbar.jsp" %>
		<!-- [이승준] 마이 페이지 상단 내비바 - END -->
	
	    <!-- [이승준] 마이 페이지 본문 - START -->
		<div class="container-fluid page-body-wrapper">
		
			<!-- [이승준] 마이 페이지 좌측 사이드바 - START -->
			<%@ include file="/WEB-INF/partials/myPageSidebar.jsp" %>
			<!-- [이승준] 마이 페이지 좌측 사이드바 - END -->
			
			<!-- [이승준] 마이 페이지 본문 - END -->
		      <!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- 내용1 -->
					<div class="row">
						<h2>지역별 방문 횟수</h2>
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<select id="yearNo" name="yearNo"  class="form-control-sm" style="float: right; margin-bottom: 20px; height:33px;">
							            <option value="">선택</option>
							            <option value="2022">2022년</option>            
							            <option value="2021">2021년</option>
							            <option value="2020">2020년</option>
							         </select>
							   									   			
							   		<select id ="sido" name ="sido" class="form-control-sm" style="float: right; margin-bottom: 20px; height:33px;">						   			            
							            <option value="강원">강원</option>
							            <option value="경기">경기</option>
							            <option value="경남">경남</option>
							            <option value="경북">경북</option>
							            <option value="광주">광주</option>
							            <option value="대구">대구</option>
							            <option value="대전">대전</option>
							            <option value="부산">부산</option>
							            <option value="서울">서울</option>
							            <option value="세종특별자치시">세종특별자치시</option>
							            <option value="울산">울산</option>
							            <option value="인천">인천</option>
							            <option value="전남">전남</option>
							            <option value="전북">전북</option>
							            <option value="제주특별자치도">제주특별자치도</option>
							            <option value="충남">충남</option>
							            <option value="충북">충북</option>						            
							   		</select>
							   		
							   		<canvas id="myChart" width="100" height="40"></canvas>
   
								   	<script type="text/javascript">
									   let ctx = document.getElementById('myChart').getContext('2d');
									   let myChart = new Chart(ctx, {});
									   
									   $('#yearNo, #sido').change(function(){
									      
									      let year = $('#yearNo').val();
									      let sido = $('#sido').val();
									      
									     
									      
									      myChart.destroy();
									      ctx = document.getElementById('myChart').getContext('2d');
									      
									      $.ajax({
									         type:'get',
									         url:'/member/getMyFavoriteAddress?year=' + year+'&sido='+sido,
									         success:function(json){
									            console.log(json);
									            
									            
									            // 월별 방문 횟수
									            let myData = [];
									            myData.push(json.january);
									            myData.push(json.february);
									            myData.push(json.march);
									            myData.push(json.april);
									            myData.push(json.may);
									            myData.push(json.june);
									            myData.push(json.july);
									            myData.push(json.august);
									            myData.push(json.september);
									            myData.push(json.october);
									            myData.push(json.november);
									            myData.push(json.december);
	            
									          	// 
												let result = myData.reduce((accumulator,currentNumber)=> accumulator + currentNumber);
																			          	
									            // chart.js
									            myChart = new Chart(ctx, {
									                type: 'bar',
									                data: {
									                    labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
									                    datasets: [{
									                        label: '방문 횟수',
									                        data: myData,
									                        backgroundColor: [
									                        	 'rgba(54, 162, 235, 0.2)'
									                            
									                        ],
									                        borderColor: [
									                        	 'rgba(54, 162, 235, 1)'
									                          
									                        ],
									                        borderWidth: 1
									                    }
									                    ]
									                },
									                options: {
									                	 plugins: {
									                         title: {
									                             display: true,
									                             text: '# '+ sido+' : '+result+'번'
									                             
									                         }
									                		
									                     },
									                    scales: {
									                        y: {
									                            beginAtZero: true
									                        }
									                    },
									                    lengend:{
									                    	display:true,
									                    	fontColor: 'rgba(255, 99, 132, 0.2)',
									                    	position:'right'
									                    }
									                }
									            });
									            
									         }
									      });
									   });
									
									   
									   </script>
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


	<script src="/js/dashboard.js"></script>
	<script src="/js/hoverable-collapse.js"></script>
	<script src="/js/template.js"></script>
	<script src="/js/settings.js"></script>
	<script src="/js/todolist.js"></script>
	<script src="/js/dashboard.js"></script>
	<script src="/js/Chart.roundedBarCharts.js"></script>
	<script src="/vendors/js/vendor.bundle.base.js"></script>
</body>

</html>