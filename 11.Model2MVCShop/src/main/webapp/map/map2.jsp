<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도보기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=5b4jg7dhdr"></script>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>

<script>

//클릭한 지점으로 마커찍기 
var position = new naver.maps.LatLng(37.3595704, 127.105399);

var map = new naver.maps.Map('map', {
    center: position,
    zoom: 15
});

var marker = new naver.maps.Marker({
    position: position,
    map: map
});

naver.maps.Event.addListener(map, 'click', function(e) {
    marker.setPosition(e.coord);
});





//마커찍기
//var map = new N.Map('map', {
//	center: new N.LatLng(37.3595704,127.105399),
//	zoom: 15
//});

//var marker = new naver.maps.Marker({
//	position: new naver.maps.LatLng(37.3595704,127.105399),
//	map: map
//});





//기본
//var mapDiv = document.getElementById('map');
//var map = new N.Map(mapDiv);





//기본예제
//var mapOptions = {
//    center: new naver.maps.LatLng(37.3595704, 127.105399),
//    zoom: 10
//};

//var map = new N.Map('map', mapOptions);




</script>
</body>
</html>