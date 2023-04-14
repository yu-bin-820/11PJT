<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>map</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=5b4jg7dhdr"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
<div id="map" style="width:1000px;height:500px;"></div>
<div>
	<table>
		<thead>
			<tr>
				<th>add</th>
				<th>Lat</th>
				<th>Lon</th>
			</tr>	
		</thead>
		<tbody id="mapList"></tbody>
	</table>
</div>
</body>

<script type="text/javascript">
$(function() {
	
	initMap();
	
});


function initMap() {
	
	let markers = new Array(); // 마커 정보를 담는 배열
	let infoWindows = new Array(); // 정보창을 담는 배열
	
	var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.552758094502494, 126.98732600494576),
        zoom: 15
    });
	
	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(37.552758094502494, 126.98732600494576),
	    map: map
	});

    
    /* 정보창 */
	 var infoWindow = new naver.maps.InfoWindow({
	        content: '<div style="width:200px;text-align:center;padding:10px;"><b>SeoulNamsan</b><br> - naver map - </div>'
	 }); // 클릭했을 때 띄워줄 정보 입력
    
	 markers.push(marker); // 생성한 마커를 담는다.
	 infoWindows.push(infoWindow); // 생성한 정보창을 담는다.
    
    
    function getClickHandler(seq) {
		
            return function(e) {  // 마커를 클릭하는 부분
                var marker = markers[seq], // 클릭한 마커의 시퀀스로 찾는다.
                    infoWindow = infoWindows[seq]; // 클릭한 마커의 시퀀스로 찾는다

                if (infoWindow.getMap()) {
                    infoWindow.close();
                } else {
                    infoWindow.open(map, marker); // 표출
                }
    		}
    	}
    
    for (var i=0, ii=markers.length; i<ii; i++) {
    	console.log(markers[i] , getClickHandler(i));
        naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); // 클릭한 마커 핸들러
    }
}

</script>

</html>