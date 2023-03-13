<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//==> 추가된부분 : "수정"  Event 연결
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "button.btn.btn-primary" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
			document.detailForm.action='/purchase/updatePurchase';
			document.detailForm.submit();
		});
		
		 $( "a[href='#' ]" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
				history.go(-1);
			});
	});	

	</script>		
		
</head>


<body>


	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
   	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
			<h3 class=" text-info">구매정보수정</h3>
	      	 <h5 class="text-muted">수정 할 <strong class="text-danger">구매 정보</strong>를 입력해 주세요.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
	<form class="form-horizontal" name = "detailForm" enctype="multipart/form-data">
	    	
		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${purchase.buyer.userId}" placeholder="구매자아이디"  readonly>
			  <input type="hidden" name="tranNo" value="${purchase.tranNo}" />
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		    <select class="form-control" name="paymentOption" id="paymentOption">
				<option value="1" ${ ! empty purchase.paymentOption && purchase.paymentOption == "1" ? "selected" : ""  } >현금구매</option>
				<option value="2" ${ ! empty purchase.paymentOption && purchase.paymentOption == "2" ? "selected" : ""  } >신용구매</option>
			</select>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
			<input type="text"  class="form-control" name="receiverName" value="${purchase.receiverName}" placeholder="변경구매자이름"/>
		</div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone"  value="${purchase.receiverPhone}" placeholder="변경구매자연락처">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr"  value="${purchase.divyAddr}" placeholder="변경구매자주소">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest"  value="${purchase.divyRequest}" placeholder="변경구매자요청사항">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		      <input type="date" name="divyDate" class="form-control" value="${purchase.divyDate"}"/>
		    </div>
		  </div>
		  
		<td bgcolor="D6D6D6" width="1"></td>
		<td width="200" class="ct_write01">
			<input type="text" readonly="readonly" name="divyDate" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20"/>
				<img 	src="../images/ct_icon_date.gif" width="15" height="15"	
							onclick="show_calendar('document.updatePurchase.divyDate', document.updatePurchase.divyDate.value)"/>
		</td>
		
		
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form end /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>
</html>