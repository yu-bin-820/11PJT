  <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>map</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=5b4jg7dhdr&submodules=geocoder"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>

<body>
<div class="search">
	<input id="address" type="text" placeholder="검색할 주소">
	<input id="submit" type="button" value="주소검색">
</div>
<div id="map" style="width:1000px;height:500px;"></div>
<div>
	<table>
		<thead>
			<tr>
				<th>주소</th>
				<th>위도</th>
				<th>경도</th>
			</tr>	
		</thead>
		<tbody id="mapList"></tbody>
	</table>
</div>
</body>
<script>
//지도를 그려주는 함수 실행
selectMapList();

	

function searchAddressToKeyword(keyword){
	
	$.ajax( 
			{
				url : "/map/json/getaddress/"+keyword ,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {

					 console.log('address: ' + JSONData[0].address);
			        searchAddressToCoordinate(JSONData[0].address);
					
				}
		});
	
}

//검색한 주소의 정보를 insertAddress 함수로 넘겨준다.
function searchAddressToCoordinate(address) {
    naver.maps.Service.geocode({
        query: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }
        if (response.v2.meta.totalCount === 0) {
            return alert('올바른 주소를 입력해주세요.');
        }
        var htmlAddresses = [],
            item = response.v2.addresses[0],
            point = new naver.maps.Point(item.x, item.y);
        if (item.roadAddress) {
            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
        }
        if (item.jibunAddress) {
            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
        }
        if (item.englishAddress) {
            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
        }

        insertAddress(item.roadAddress, item.x, item.y);
        
    });
}

// 주소 검색의 이벤트
$('#address').on('keydown', function(e) {
    var keyCode = e.which;
    if (keyCode === 13) { // Enter Key
    	searchAddressToKeyword($('#address').val());
    }
});
$('#submit').on('click', function(e) {
    e.preventDefault();
    searchAddressToKeyword($('#address').val());
});

naver.maps.Event.once(map, 'init_stylemap', initGeocoder);


    
//검색정보를 테이블로 작성해주고, 지도에 마커를 찍어준다.
function insertAddress(address, latitude, longitude) {
	var mapList = "";
	mapList += "<tr>"
	mapList += "	<td>" + address + "</td>"
	mapList += "	<td>" + latitude + "</td>"
	mapList += "	<td>" + longitude + "</td>"
	mapList += "</tr>"

	$('#mapList').append(mapList);	

	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(longitude, latitude),
	    zoom: 14
	});
    var marker = new naver.maps.Marker({
        map: map,
        position: new naver.maps.LatLng(longitude, latitude),
    });
}

//지도를 그려주는 함수
function selectMapList() {
	
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.3595704, 127.105399),
	    zoom: 10
	});
}


// 지도를 이동하게 해주는 함수
function moveMap(len, lat) {
	var mapOptions = {
		    center: new naver.maps.LatLng(len, lat),
		    zoom: 15,
		    mapTypeControl: true
		};
    var map = new naver.maps.Map('map', mapOptions);
    var marker = new naver.maps.Marker({
        position: new naver.maps.LatLng(len, lat),
        map: map
    });
}
</script>

</html>