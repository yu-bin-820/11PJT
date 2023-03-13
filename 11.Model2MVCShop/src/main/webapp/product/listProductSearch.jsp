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

	//=====기존Code 주석 처리 후  jQuery 변경 ======//
	// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetProductList(currentPage){
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$('form').attr("method","POST").attr("href", "/product/listProduct?menu=search").submit();
	}
	//===========================================//
	//==> 추가된부분 : "검색" , link  Event 연결 및 처리

	$(function(){
		
		//==> userId LINK Event 연결처리
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
		$( ".btn-primary").on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				self.location ="/product/getProduct?prodNo="+$(this).children('input:hidden').val();
				
		});
		
		//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
		$( ".btn-default").on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				self.location ="/purchase/addPurchase?prodNo="+$(this).children('input:hidden').val();
				
		});
		
	})
	
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
	
	
	/////////////////////무한스크롤////////////////////////
	
	let isEnd = false;
	
	
	var search = {
			"currentPage" : "${resultPage.currentPage}",
			"searchCondition" : "${search.searchCondition}" ,
			"searchKeyword" : "${search.searchKeyword}"
		}
	
	
$(function(){
	$(document).scroll(function() {
		if($(document).scrollTop() + $(window).height() > $(document).height()) { 
			search.currentPage++;
				testAjax(); //ajax 호출
		}
        });
        // 무한 스크롤 ajax 요청
        
        
        testAjax = function() {
        	
        	if(isEnd == true){
        		return;
        	}
        	
            $.ajax({
                type     : 'POST',
                url      : '/product/json/listProduct',
                data     : JSON.stringify(search), // 다음 페이지 번호를 가지고 갑니다.
                dataType : 'json',
                contentType: "application/json",
                success : function(JSONData){
                	successCallback(JSONData);
                },
                error : errorCallback
            });
            // 성공
            function successCallback(JSONData) {
                $.each(JSONData, function(index, product){
                	$('.row').eq(1).append(		
                			'<div class="col-sm-6 col-md-4">'
            				+'<div class="thumbnail">'
              				+'<img src="/images/uploadFiles/'+product.fileName+'"/>'
              				+'<div class="caption">'
                			+'<h3>'+product.prodName+'</h3>'
                			+'<p>'+product.price+'</p>'
                			+'<p><a href="#" class="btn btn-primary" role="button">상세보기<input type = "hidden" id= "prodNo" name = "prodNo" value="'+product.prodNo+'"/></a>'
                			+'<a href="#" class="btn btn-default" role="button">결   제<input type = "hidden" id= "prodNo" name = "prodNo" value="'+product.prodNo+'"/></a></p>'
              				+'</div>'
            				+'</div>'
          					+'</div>'
                			
                	)
                })
                
        		$( ".btn-primary").on("click" , function() {
    				//Debug..
    				//alert(  $( this ).text().trim() );
    				self.location ="/product/getProduct?prodNo="+$(this).children('input:hidden').val();
    				
    		});
   
            }
            
            // 실패
            function errorCallback() {
                alert("실패");
            }
        }
        
        // 테스트 데이터 setting
		   
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
			<h3>상품 목록 조회</h3>
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

		<div class="row">
		<c:set var="i" value="0" />
		<c:forEach var="product" items="${list}">
		<div class="col-sm-6 col-md-4">
    		<div class="thumbnail">
      		<img src="/images/uploadFiles/${product.fileName}"/>
      		<div class="caption">
        	<h3>${product.prodName}</h3>
        	
        	<p>${product.price}</p>
        	<p><a href="#" class="btn btn-primary" role="button">상세보기<input type = 'hidden' id= "prodNo" name = 'prodNo' value='${product.prodNo}'/></a> 
        	<a href="#" class="btn btn-default" role="button">구   매<input type = 'hidden' id= "prodNo" name = 'prodNo' value='${product.prodNo}'/></a></p>
      	</div>
    	</div>
  		</div>
  		<%--
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
				<td align="Left">판매중	</td>
			</tr>
		 --%>
		</c:forEach>
</div>
      
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
 	<%--<jsp:include page="../common/pageNavigatorProduct_new.jsp"/>	--%>
	<!-- PageNavigation End... -->
	
</body>

</html>


