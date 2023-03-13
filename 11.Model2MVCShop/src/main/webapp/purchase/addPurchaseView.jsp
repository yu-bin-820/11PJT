<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>상품상세조회</title>
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="../javascript/calendar.js">
	</script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
        body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
     </style>

	<script type="text/javascript">

	
	 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $("button.btn.btn-primary" ).on("click" , function() {
				//Debug..
				console.log(  $( "td.ct_btn01:contains('구매')" ).html() );
				$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
				});
			});	
	 
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
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
	
		<h1 class="bg-primary text-center">상품상세조회</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name = "detailForm" enctype="multipart/form-data">
		
		
			<div class="form-group">
				<label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호 </label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}" readonly>
		  	</div>
		  	</div>
		    
					  
			<div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" readonly>
		  	</div>
		  	</div>
		  
		   <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		    <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}" readonly>
		  	</div>
		  	</div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		    <input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate}" readonly>
		  	</div>
		  	</div>
		  
		 <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		    <input type="text" class="form-control" id="price" name="price" value="${product.price}" readonly>
		  	</div>
		  	</div>
		  	
		  
		 <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
		    <div class="col-sm-4">
			<input type="text" class="form-control" id="regDate" name="regDate" value="${product.regDate}" readonly>
		  	</div>
		  	</div>

		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
		    <input type="text" class="form-control" id="userId" name="userId" value="${ user.userId}" readonly>
		  	</div>
		  	</div>

		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		    <select class="form-control" name="paymentOption" id="paymentOption">
				<option value="1" ${ ! empty purchase.paymentOption && purchase.paymentOption == "1" ? "selected" : ""  } >현금구매</option>
				<option value="2" ${ ! empty purchase.paymentOption && purchase.paymentOption == "2" ? "selected" : ""  } >신용구매</option>
			</select>
		    </div>
		</div>
			
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverName" class="form-control" value="${user.userName}"/>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
		    <div class="col-sm-4">
		      <input type="text" name="receiverPhone" class="form-control" value="${user.phone}"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		    <div class="col-sm-4">
		      <input type="text" name="divyAddr" class="form-control" value="${user.addr}"/>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="구매요청사항">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		      <input type="date" name="divyDate" class="form-control" />
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >구 &nbsp;매</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form end /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>
</html>