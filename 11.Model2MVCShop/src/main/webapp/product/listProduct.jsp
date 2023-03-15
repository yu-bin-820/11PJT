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
	
	//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	function fncGetProductList(currentPage){
		
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$("form").attr("method","POST").attr("href", "/product/listProduct?menu=manage").submit();
	}
	//===========================================//
	// "검색"   Event 연결 및 처리

	$(function(){
		//==>검색 Event 연결처리부분 
		//==>DOM Object GET 3가지 방법 ==> 1. $(tagNane) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
		$( "button.btn.btn-default").on("click", function(){
			fncGetProductList(1);
		});
		
		//$( "button.btn.btn-danger").on("click", function(){
		//	self.location = "/purchase/json/updateTranCodeByProd?prodNo="+$(this).children('input:hidden').val()+"&tranCode=2"
		//});
		
		//==> userId LINK Event 연결처리
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
		$( "td:nth-child(2)").on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				self.location ="/product/updateProduct?prodNo="+$(this).children('input:hidden').val();
				
		});
		
		//============= productNo 에 회원정보보기  Event  처리 (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-danger").on("click" , function() {

					var prodNo = $(this).children('input:hidden').val()
					$(this).remove();
					$.ajax( 
							{
								url : "/purchase/json/updateTranCodeByProd?prodNo="+prodNo+"&tranCode=2" ,
								method : "GET" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function() {
									alert("!!");
									
									//$( "#"+prodNo+"" ).html(displayValue);
								}
						});
					
			});
			
		
		});	
		////////////////////////////////////////////////////////////////
		
		
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
		$(  "td:nth-child(6) > i" ).on("click" , function() {

			var prodNo = $(this).next().val();
		
			$.ajax( 
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

							var displayValue = "<h6>"
										+"상품번호 : "+JSONData.prodNo+"<br/>"
										+"상품명 : "+JSONData.prodName+"<br/>"
										+"상세정보 : "+JSONData.prodDetail+"<br/>"
										+"제조일자 : "+JSONData.manuDate+"<br/>"
										+"가격 : "+JSONData.price+"<br/>"
										+"<br/>"
										+"<input type = 'button' value ='상세보기' name = 'getProduct' id='getProduct'/>"
										+"<br/>"
										+"</h6>";
							$("h6").remove();
							$( "#"+prodNo+"" ).html(displayValue);
							
							 $( "#getProduct" ).on("click" , function() {
									//Debug..
									//alert(  $( "td.ct_btn01:contains('구매')" ).html() );
									self.location = "/product/getProduct?prodNo="+prodNo;
								});
						}
				});
				////////////////////////////////////////////////////////////////////////////////////////////
			
	});
		
		//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");


	
	 $( function() {
		    var availableTags = null;
		    $.ajax(
					{
						url : "/product/json/autocompleteProduct",
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							//alert(JSON.stringify(JSONData));
							availableTags=JSONData;
							$( "#searchKeyword" ).autocomplete({
							      source: availableTags
						    });
						}
					}
			);
		   
		    
	});
	 
		//============= productNo 에 회원정보보기  Event  처리 (double Click)=============
	 $(function() {
		 
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$(  "td:nth-child(6) > i" ).on("click" , function() {

				var prodNo = $(this).next().val();
			
				$.ajax( 
						{
							url : "/product/json/getProduct/"+prodNo ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								var displayValue = "<h6>"
															+"상품명 : "+JSONData.prodName+"<br/>"
															+"상세정보 : "+JSONData.prodDetail+"<br/>"
															+"제조일자 : "+JSONData.manuDate+"<br/>"
															+"가격 : "+JSONData.price+"<br/>"
															+"</h6>";
								$("h6").remove();
								$( "#"+prodNo+"" ).html(displayValue);
							}
					});
					////////////////////////////////////////////////////////////////////////////////////////////
				
		});
		
		//==> userId LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		//==> 아래와 같이 정의한 이유는 ??
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	});	
	</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>상품 관리</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
				    	<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
						<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 end /////////////////////////////////////-->


      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">현재상태</th>
            <th align="left">정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		<c:set var="i" value="0" />
		<c:forEach var="product" items="${list}">
			<c:set var="i" value="${i+1}" />
			<tr>
				<td align="center">${i}</td>
				<td align="Left" title="Click : 상품정보 확인">
				<input type = 'hidden' id= "prodNo" name = 'prodNo' value='${product.prodNo}'/>
				<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
				<a href="/product/updateProduct?prodNo=${product.prodNo}">${product.prodName }</a>
				////////////////////////////////////////////////////////////////////////////////////////////////// -->
				${product.prodName}
				</td>
				<td align="Left">${product.price}</td>
				<td align="Left">${product.regDate}</td>
				<td align="Left" id='proTranCode'>
				<c:choose>
					<c:when test= "${product.proTranCode=='0'||product.proTranCode==null}">
					판매중
					</c:when>
					<c:when test= "${product.proTranCode=='1'}">
						구매완료 
						<button class="btn btn-danger">
							<input type = 'hidden' id= "prodNo" name = 'prodNo' value='${product.prodNo}'/>
							배송하기
						</button>		
					</c:when>
					<c:when test= "${product.proTranCode=='2' }">
					배송중
					</c:when>
					<c:when test= "${product.proTranCode=='3'}">
					배송완료
					</c:when>
				</c:choose>
				</td>
				<td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
			  	<input type="hidden" value="${product.prodNo}">
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


