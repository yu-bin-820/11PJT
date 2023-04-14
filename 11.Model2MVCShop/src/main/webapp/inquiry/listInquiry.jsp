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
	

	$(function(){
		
		
		//==> LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
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

		
		//==> UI ���� �߰��κ�  :  LINK Event End User ���� ���ϼ� �ֵ��� 
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");



	</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3></h3>
	    </div>
	    
	  
	<!-- 1:1 ���� �� ����� butten  
		<div class="customer-service__main-consulting-btns">
			<a href="javascript:overpass.cst.goQuestionRegist()" class="register-inquiry-btn black">
			<span class="icon-pen replace-text">�� ������</span> 1:1 �����ۼ�
			</a>
			<a onclick="window.open('http://pf.kakao.com/_wQgxcxl/chat')">						
			<span class="icon-kakao replace-text">īī���� ������</span> īī���� ����ϱ�
			</a>
		</div> -->  
	  <div class="jumbotron">
        	<a href="javascript:overpass.cst.goQuestionRegist()" class="register-inquiry-btn black">
			<span class="glyphicon glyphicon-penci">�� ������</span> 1:1 �����ۼ�
			</a>
      </div>
	    <!-- table ���� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
	    	
		</div>
		<!-- table ���� end /////////////////////////////////////-->


      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��������</th>
            <th align="left">�Խ���</th>
            <th align="left">�亯����</th>
          </tr>
        </thead>
       
		<tbody>
		
		<c:set var="i" value="0" />
		<c:forEach var="inquiry" items="${list}">
			<c:set var="i" value="${i+1}" />
			<tr>
				<td align="center">${i}</td>

				<td align="Left">${inquiry.title}</td>
				
				<td align="Left" title="Click : ���ǻ��� Ȯ��">
				<input type = 'hidden' id= "inquiryNo" name = 'inquiryNo' value='${inquiry.inquiryNo}'/>
				${inquiry.inquiryNo}
				</td>
				
				<td align="Left">${inquiry.postDate}</td>
				<td align="Left" >
				�亯�� ó������ �ʾҽ��ϴ�.
				<i class="glyphicon glyphicon-ok" id= "${inquiry.inquiryNo}"></i>
				<!--<c:choose>
					<c:when test= "${product.proTranCode=='0'||product.proTranCode==null}">
					�Ǹ���
					</c:when>
					<c:when test= "${product.proTranCode=='1'}">
						���ſϷ� 
						<button class="btn btn-danger">
							<input type = 'hidden' id= "${product.prodNo}" name = 'prodNo' value='${product.prodNo}'/>
							����ϱ�
						</button>		
					</c:when>
					<c:when test= "${product.proTranCode=='2' }">
					�����
					</c:when>
					<c:when test= "${product.proTranCode=='3'}">
					��ۿϷ�
					</c:when>
				</c:choose>-->
				</td>
			</tr>
		</c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
 	<jsp:include page="../common/pageNavigatorProduct_new.jsp"/>	
	<!-- PageNavigation End... -->
	
</body>

</html>


