<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>관리자 수정</title>

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
	<!-- endinject -->
	<link rel="shortcut icon" href="../skydash/images/favicon.png" />/>
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="/images/logo/logo_myPage.svg" alt="logo">
              </div>
              <h4>관리자 등급 수정</h4>
              <form class="pt-3" method="post" action= "modifyAdminList" id="modifyAdminList">
                  <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name = "adminNo"value="${admin.adminNo}" readonly>
                </div>
                 <div class="form-group">
                  <input type="text" class="form-control form-control-lg" value="${admin.adminId}" readonly>
                </div>
                 <div class="form-group">
                  <input type="text" class="form-control form-control-lg" value="${admin.adminName}" readonly>
                </div>
                <div class="form-group">
                  <select name="adminPositionNo" id="adminPositionNo" class="form-control form-control-lg">
                  	<option value ="5">1 : 운영관리자</option>
                  	<option value ="4">2 : 회원관리자</option>
                  	<option value ="3">3 : 숙소 관리자</option>
                  	<option value ="2">4 : 재무 관리자</option>
                  </select>
                </div>
        
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" onclick="return chk_form()">등급 수정</a>
                </div>
       
              </form>
            </div>
          </div>
          
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
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
  
  <!-- 유효성 검사 -->
  	<script>
	function chk_form() {
		if(document.getElementById("adminPositionNo").value==''){
			alert("포지션을 입력해주세여");
			return false;
		}
		
		document.getElementById("modifyAdminList").submit();
		}
	</script>
</body>
</html>