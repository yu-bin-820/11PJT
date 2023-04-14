<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>


<html>

<head>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	

	$(function(){
		
		
		//==> LINK Event 연결처리
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
		$( "td:nth-child(2)").on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				self.location ="/product/updateProduct?prodNo="+$(this).children('input:hidden').val();
				
		});
		
		
		$( "td:nth-child(2)" ).css("color" , "red");
		
		});	
		
		$( "td:nth-child(2)" ).on("hover", function(){
			tooltip();
			var prodNo=$(this).childern('input:hidden').val();
			$ajax(
					{
						url : "/product/json/getProduct"+prodNo,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							//alert($(item).children('input:hidden').val());
							var prodDetail = JSONData.prodDetail
							$(item).attr('title',prodDetail);
						}
					}
					);
		});

		
		//==> UI 수정 추가부분  :  LINK Event End User 에게 보일수 있도록 
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");



	</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3></h3>
	    </div>
	    
	  
	<!-- 1:1 문의 글 남기기 butten  
		<div class="customer-service__main-consulting-btns">
			<a href="javascript:overpass.cst.goQuestionRegist()" class="register-inquiry-btn black">
			<span class="icon-pen replace-text">펜 아이콘</span> 1:1 문의작성
			</a>
			<a onclick="window.open('http://pf.kakao.com/_wQgxcxl/chat')">						
			<span class="icon-kakao replace-text">카카오톡 아이콘</span> 카카오톡 상담하기
			</a>
		</div> -->  
	  <div class="jumbotron">
        	<a href="javascript:overpass.cst.goQuestionRegist()" class="register-inquiry-btn black">
			<span class="glyphicon glyphicon-penci">펜 아이콘</span> 1:1 문의작성
			</a>
      </div>
	    <!-- table 위쪽 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
	    	
		</div>
		<!-- table 위쪽 end /////////////////////////////////////-->


      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >문의제목</th>
            <th align="left">게시일</th>
            <th align="left">답변상태</th>
          </tr>
        </thead>
       
		<tbody>
		
		<c:set var="i" value="0" />
		<c:forEach var="inquiry" items="${list}">
			<c:set var="i" value="${i+1}" />
			<tr>
				<td align="center">${i}</td>

				<td align="Left">${inquiry.title}</td>
				
				<td align="Left" title="Click : 문의사항 확인">
				<input type = 'hidden' id= "inquiryNo" name = 'inquiryNo' value='${inquiry.inquiryNo}'/>
				${inquiry.inquiryNo}
				</td>
				
				<td align="Left">${inquiry.postDate}</td>
				<td align="Left" >
				답변이 처리되지 않았습니다.
				<i class="glyphicon glyphicon-ok" id= "${inquiry.inquiryNo}"></i>
				<!--<c:choose>
					<c:when test= "${product.proTranCode=='0'||product.proTranCode==null}">
					판매중
					</c:when>
					<c:when test= "${product.proTranCode=='1'}">
						구매완료 
						<button class="btn btn-danger">
							<input type = 'hidden' id= "${product.prodNo}" name = 'prodNo' value='${product.prodNo}'/>
							배송하기
						</button>		
					</c:when>
					<c:when test= "${product.proTranCode=='2' }">
					배송중
					</c:when>
					<c:when test= "${product.proTranCode=='3'}">
					배송완료
					</c:when>
				</c:choose>-->
				</td>
			</tr>
		</c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
 	<jsp:include page="../common/pageNavigatorProduct_new.jsp"/>	
	<!-- PageNavigation End... -->
	
</body>

</html>


