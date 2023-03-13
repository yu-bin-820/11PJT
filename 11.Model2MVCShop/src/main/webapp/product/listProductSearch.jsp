<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>


<html>

<head>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	//=====����Code �ּ� ó�� ��  jQuery ���� ======//
	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetProductList(currentPage){
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$('form').attr("method","POST").attr("href", "/product/listProduct?menu=search").submit();
	}
	//===========================================//
	//==> �߰��Ⱥκ� : "�˻�" , link  Event ���� �� ó��

	$(function(){
		
		//==> userId LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
		$( ".btn-primary").on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				self.location ="/product/getProduct?prodNo="+$(this).children('input:hidden').val();
				
		});
		
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
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
	
	
	/////////////////////���ѽ�ũ��////////////////////////
	
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
				testAjax(); //ajax ȣ��
		}
        });
        // ���� ��ũ�� ajax ��û
        
        
        testAjax = function() {
        	
        	if(isEnd == true){
        		return;
        	}
        	
            $.ajax({
                type     : 'POST',
                url      : '/product/json/listProduct',
                data     : JSON.stringify(search), // ���� ������ ��ȣ�� ������ ���ϴ�.
                dataType : 'json',
                contentType: "application/json",
                success : function(JSONData){
                	successCallback(JSONData);
                },
                error : errorCallback
            });
            // ����
            function successCallback(JSONData) {
                $.each(JSONData, function(index, product){
                	$('.row').eq(1).append(		
                			'<div class="col-sm-6 col-md-4">'
            				+'<div class="thumbnail">'
              				+'<img src="/images/uploadFiles/'+product.fileName+'"/>'
              				+'<div class="caption">'
                			+'<h3>'+product.prodName+'</h3>'
                			+'<p>'+product.price+'</p>'
                			+'<p><a href="#" class="btn btn-primary" role="button">�󼼺���<input type = "hidden" id= "prodNo" name = "prodNo" value="'+product.prodNo+'"/></a>'
                			+'<a href="#" class="btn btn-default" role="button">��   ��<input type = "hidden" id= "prodNo" name = "prodNo" value="'+product.prodNo+'"/></a></p>'
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
            
            // ����
            function errorCallback() {
                alert("����");
            }
        }
        
        // �׽�Ʈ ������ setting
		   
	});

	</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
			<h3>��ǰ ��� ��ȸ</h3>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
				    	<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� end /////////////////////////////////////-->


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
        	<p><a href="#" class="btn btn-primary" role="button">�󼼺���<input type = 'hidden' id= "prodNo" name = 'prodNo' value='${product.prodNo}'/></a> 
        	<a href="#" class="btn btn-default" role="button">��   ��<input type = 'hidden' id= "prodNo" name = 'prodNo' value='${product.prodNo}'/></a></p>
      	</div>
    	</div>
  		</div>
  		<%--
			<c:set var="i" value="${i+1}" />
			<tr>
				<td align="center">${i}</td>
				<td align="Left" title="Click : ��ǰ���� Ȯ��">
				<input type = 'hidden' id= "prodNo" name = 'prodNo' value='${product.prodNo}'/>
				<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
				<a href="/product/updateProduct?prodNo=${product.prodNo}">${product.prodName }</a>
				////////////////////////////////////////////////////////////////////////////////////////////////// -->
				${product.prodName}
				</td>
				<td align="Left">${product.price}</td>
				<td align="Left">${product.regDate}</td>
				<td align="Left">�Ǹ���	</td>
			</tr>
		 --%>
		</c:forEach>
</div>
      
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
 	<%--<jsp:include page="../common/pageNavigatorProduct_new.jsp"/>	--%>
	<!-- PageNavigation End... -->
	
</body>

</html>


