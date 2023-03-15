<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<title>���� �����ȸ</title>
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	function fncGetPurchaseList(currentPage){
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
		//document.detailForm.submit();
		$("form").attr("method","POST").attr("href", "/purchase/listPurchase").submit();
	}
	//===========================================//
	
	$(function(){
		
		//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$( ".ct_list_pop td:nth-child(2)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
		$( ".ct_list_pop td:nth-child(2)" ).css("color" , "red");
		$("h7").css("color" , "red");
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		
		//==> tranNo LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
		$( ".ct_list_pop td:nth-child(1)" ).on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				self.location ="/purchase/getPurchase?tranNo="+$(this).children('input:hidden').val();
				
		});
		
		//==> userId LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
		$( ".ct_list_pop td:nth-child(2)" ).on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				self.location ="/user/getUser?userId="+$(this).text().trim();
				
		});
		
		//==> updateTranCode LINK Event ����ó��
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
		$( ".ct_list_pop td:nth-child(6)" ).on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
			self.location ="/purchase/updateTranCode?tranNo="+$(this).children('input:hidden').val()+"&tranCode=3";
				
		});
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
	       <h3>���� �����ȸ</h3>
	    </div>
	    
	    
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
				��ü ${ resultPage.totalCount} �Ǽ�, ���� ${ resultPage.currentPage} ������		    	</p>
		    </div>
		    
		</div>
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >ȸ��ID</th>
            <th align="left" >ȸ����</th>
            <th align="left" >��ȭ��ȣ</th>
            <th align="left" >�����Ȳ</th>
            <th align="left" >��������</th>
	 	  </tr>
        </thead>
       
		<tbody>
		
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${map}">
		<c:set var="i" value="${i+1}"/>
			<tr class="ct_list_pop">
			  <td align="center">
				<input type= 'hidden' id="tranNo" name="tranNo" value='${purchase.tranNo}'/>
				${i}</td>
				<td align="left">${user.userId}	</td>
				<td align="left">${purchase.receiverName}</td>
				<td align="left">${purchase.receiverPhone}</td>
				<td align="left">
				����	
				<c:choose>
					<c:when test="${purchase.tranCode == '1' }">
						���ſϷ� �����Դϴ�.</td>
						<td></td>
					</c:when>
					<c:when test="${purchase.tranCode == '2' }">
						����� �����Դϴ�.</td>
						<td>
						<input type= 'hidden' id="tranNo" name="tranNo" value='${purchase.tranNo}'/>
						���ǵ���
						</td>
					</c:when>
					<c:when test="${purchase.tranCode == '3' }">
						��ۿϷ� �����Դϴ�.</td>
						<td></td>
					</c:when>
				</c:choose>  	
			</tr>
		</c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigatorPurchase_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>