<!DOCTYPE html>

<html lang="ko">
<head>
    <link href="/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link href="/favicon.ico" rel="icon" type="image/x-icon">

    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, shrink-to-fit=no">
    <title>좌표계 변환하기 | 네이버 지도 API v3</title>
    <meta name="description" content="Example: 좌표계 변환하기">
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="NAVER Maps API v3 바로가기">
    <meta property="og:title" content="NAVER Maps API v3">
    <meta property="og:description" content="NAVER Maps API v3로 여러분의 지도를 만들어 보세요. 유용한 기술문서와 다양한 예제 코드를 제공합니다.">
    <meta property="og:image" content="https://navermaps.github.io/maps.js/docs/img/NAVERMaps.png">
    <meta property="og:url" content="https://navermaps.github.io/maps.js">
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="NAVER Maps API v3">
    <meta name="twitter:description" content="NAVER Maps API v3로 여러분의 지도를 만들어 보세요. 유용한 기술문서와 다양한 예제 코드를 제공합니다.">
    <meta name="twitter:image" content="https://navermaps.github.io/maps.js/docs/img/NAVERMaps.png">
    <meta name="twitter:url" content="https://navermaps.github.io/maps.js">

    <!--[if lt IE 9]>
    <style type="text/css">
    .dropdown-menu {
       max-height: 500px !important;
    }
    </style>
    <![endif]-->
    <link type="text/css" rel="stylesheet" href="styles/sunlight.default.css">
    <link type="text/css" rel="stylesheet" href="styles/site.flatly.css">
    <link type="text/css" rel="stylesheet" href="./css/highlightjs.css">
</head>


<body>

<div class="navbar navbar-default navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.html">
            
            <img class="branding-logo" src="./img/logo-ncp.png" alt="logo">
             
            </a>
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#topNavigation">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse" id="topNavigation">
            <ul class="nav navbar-nav">
                
                
                <li class="dropdown">
                    <a href="namespaces.list.html" itemprop="mainEntityOfPage" class="dropdown-toggle dropdown-toggle-namespaces" data-toggle="dropdown">Namespaces<b class="caret"></b></a>
                    <ul class="dropdown-menu ">
                        
                        <li><a href="naver.html">naver</a></li><li><a href="naver.maps.html">naver.maps</a></li><li><a href="naver.maps.drawing.html">naver.maps.drawing</a></li><li><a href="naver.maps.visualization.html">naver.maps.visualization</a></li>
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="classes.list.html" itemprop="mainEntityOfPage" class="dropdown-toggle dropdown-toggle-classes" data-toggle="dropdown">Classes<b class="caret"></b></a>
                    <ul class="dropdown-menu ">
                        
                        <li><a href="#" class="_cat" style="padding-left:10px" >Base</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.LatLng.html">naver.maps.LatLng</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.LatLngBounds.html">naver.maps.LatLngBounds</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.Point.html">naver.maps.Point</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.PointBounds.html">naver.maps.PointBounds</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.Size.html">naver.maps.Size</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >KVO</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.KVO.html">naver.maps.KVO</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.KVOArray.html">naver.maps.KVOArray</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Map</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.Map.html">naver.maps.Map</a></li>
                
                        <li><a href="#" class="_cat _subcat" style="padding-left:20px" >Tile</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.CanvasTile.html">naver.maps.CanvasTile</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.ImageTile.html">naver.maps.ImageTile</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.Tile.html">naver.maps.Tile</a></li>
                
                        <li><a href="#" class="_cat _subcat" style="padding-left:20px" >MapType</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.CanvasMapType.html">naver.maps.CanvasMapType</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.ImageMapType.html">naver.maps.ImageMapType</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.MapTypeRegistry.html">naver.maps.MapTypeRegistry</a></li>
                
                        <li><a href="#" class="_cat _subcat" style="padding-left:30px" >preset</a></li>
                
                        <li><a style="padding-left:40px;" href="naver.maps.NaverMapTypeOptions.html">naver.maps.NaverMapTypeOptions</a></li>
                
                        <li><a style="padding-left:40px;" href="naver.maps.NaverStyleMapTypeOptions.html">naver.maps.NaverStyleMapTypeOptions</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Control</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.CustomControl.html">naver.maps.CustomControl</a></li>
                
                        <li><a href="#" class="_cat _subcat" style="padding-left:20px" >Naver Controls</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.LogoControl.html">naver.maps.LogoControl</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.MapDataControl.html">naver.maps.MapDataControl</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.MapTypeControl.html">naver.maps.MapTypeControl</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.ScaleControl.html">naver.maps.ScaleControl</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.ZoomControl.html">naver.maps.ZoomControl</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Layer</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.Layer.html">naver.maps.Layer</a></li>
                
                        <li><a href="#" class="_cat _subcat" style="padding-left:20px" >Naver Layers</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.BicycleLayer.html">naver.maps.BicycleLayer</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.CadastralLayer.html">naver.maps.CadastralLayer</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.LabelLayer.html">naver.maps.LabelLayer</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.StreetLayer.html">naver.maps.StreetLayer</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.TrafficLayer.html">naver.maps.TrafficLayer</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Data Layer</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.Data.html">naver.maps.Data</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.Feature.html">naver.maps.Feature</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.Geometry.html">naver.maps.Geometry</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Overlay</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.OverlayView.html">naver.maps.OverlayView</a></li>
                
                        <li><a href="#" class="_cat _subcat" style="padding-left:20px" >Naver Overlays</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.Circle.html">naver.maps.Circle</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.Ellipse.html">naver.maps.Ellipse</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.GroundOverlay.html">naver.maps.GroundOverlay</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.InfoWindow.html">naver.maps.InfoWindow</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.Marker.html">naver.maps.Marker</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.Polygon.html">naver.maps.Polygon</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.Polyline.html">naver.maps.Polyline</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.Rectangle.html">naver.maps.Rectangle</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Submodule: drawing</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.drawing.DrawingManager.html">naver.maps.drawing.DrawingManager</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Submodule: panorama</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.AroundControl.html">naver.maps.AroundControl</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.FlightSpot.html">naver.maps.FlightSpot</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.Panorama.html">naver.maps.Panorama</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Submodule: visualization</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.visualization.DotMap.html">naver.maps.visualization.DotMap</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.visualization.HeatMap.html">naver.maps.visualization.HeatMap</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.visualization.WeightedLocation.html">naver.maps.visualization.WeightedLocation</a></li>
                
                        
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="interfaces.list.html" itemprop="mainEntityOfPage" class="dropdown-toggle dropdown-toggle-interfaces" data-toggle="dropdown">Interfaces<b class="caret"></b></a>
                    <ul class="dropdown-menu ">
                        
                        <li><a href="#" class="_cat" style="padding-left:10px" >Abstract</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.MapSystemProjection.html">naver.maps.MapSystemProjection</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.MapType.html">naver.maps.MapType</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.Projection.html">naver.maps.Projection</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Submodule: panorama</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.PanoramaProjection.html">naver.maps.PanoramaProjection</a></li>
                
                        
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="mixins.list.html" itemprop="mainEntityOfPage" class="dropdown-toggle dropdown-toggle-statics" data-toggle="dropdown">Statics<b class="caret"></b></a>
                    <ul class="dropdown-menu ">
                        
                        <li><a href="#" class="_cat" style="padding-left:10px" >Event</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.Event.html">naver.maps.Event</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Projection</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.EPSG3857.html">naver.maps.EPSG3857</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.UTMK.html">naver.maps.UTMK</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.UTMK_NAVER.html">naver.maps.UTMK_NAVER</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Submodule: geocoder</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.Service.html">naver.maps.Service</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.TransCoord.html">naver.maps.TransCoord</a></li>
                
                        <li><a href="#" class="_cat _subcat" style="padding-left:20px" >Extended Projection</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.EPSG3857Coord.html">naver.maps.EPSG3857Coord</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.TM128.html">naver.maps.TM128</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.TM128Coord.html">naver.maps.TM128Coord</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.UTMK_NAVERCoord.html">naver.maps.UTMK_NAVERCoord</a></li>
                
                        <li><a style="padding-left:30px;" href="naver.maps.UTMKCoord.html">naver.maps.UTMKCoord</a></li>
                
                        <li><a href="#" class="_cat" style="padding-left:10px" >Submodule: visualization</a></li>
                
                        <li><a style="padding-left:20px;" href="naver.maps.visualization.SpectrumStyle.html">naver.maps.visualization.SpectrumStyle</a></li>
                
                        
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="global.html" itemprop="mainEntityOfPage" class="dropdown-toggle dropdown-toggle-types" data-toggle="dropdown">Types<b class="caret"></b></a>
                    <ul class="dropdown-menu ">
                        
                        <li><a href="global.html#any">any</a></li><li><a href="global.html#array">array</a></li><li><a href="global.html#ArrayOfBounds">ArrayOfBounds</a></li><li><a href="global.html#ArrayOfBoundsLiteral">ArrayOfBoundsLiteral</a></li><li><a href="global.html#ArrayOfCoords">ArrayOfCoords</a></li><li><a href="global.html#ArrayOfCoordsLiteral">ArrayOfCoordsLiteral</a></li><li><a href="global.html#boolean">boolean</a></li><li><a href="global.html#Bounds">Bounds</a></li><li><a href="global.html#BoundsLiteral">BoundsLiteral</a></li><li><a href="global.html#Coord">Coord</a></li><li><a href="global.html#CoordLiteral">CoordLiteral</a></li><li><a href="global.html#DOMEvent">DOMEvent</a></li><li><a href="global.html#DOMEventListener">DOMEventListener</a></li><li><a href="global.html#DrawingOverlay">DrawingOverlay</a></li><li><a href="global.html#FitBoundsOptions">FitBoundsOptions</a></li><li><a href="global.html#function">function</a></li><li><a href="global.html#GeoJSON">GeoJSON</a></li><li><a href="global.html#GPX">GPX</a></li><li><a href="global.html#HTMLElement">HTMLElement</a></li><li><a href="global.html#ImageData">ImageData</a></li><li><a href="global.html#isDefaultMapType">isDefaultMapType</a></li><li><a href="global.html#KeyboardEvent">KeyboardEvent</a></li><li><a href="global.html#KML">KML</a></li><li><a href="global.html#KVOArrayOfCoords">KVOArrayOfCoords</a></li><li><a href="global.html#LatLngBoundsLiteral">LatLngBoundsLiteral</a></li><li><a href="global.html#LatLngBoundsObjectLiteral">LatLngBoundsObjectLiteral</a></li><li><a href="global.html#LatLngLiteral">LatLngLiteral</a></li><li><a href="global.html#LatLngObjectLiteral">LatLngObjectLiteral</a></li><li><a href="global.html#LayerRegistry">LayerRegistry</a></li><li><a href="global.html#limitMaxBounds">limitMaxBounds</a></li><li><a href="global.html#limitMinZoom">limitMinZoom</a></li><li><a href="global.html#MapEventListener">MapEventListener</a></li><li><a href="global.html#MapType">MapType</a></li><li><a href="global.html#margin">margin</a></li><li><a href="global.html#null">null</a></li><li><a href="global.html#number">number</a></li><li><a href="global.html#object">object</a></li><li><a href="global.html#OVERLAY_TYPE_ORDER_IN_HOUSE">OVERLAY_TYPE_ORDER_IN_HOUSE</a></li><li><a href="global.html#padding">padding</a></li><li><a href="global.html#PointArrayLiteral">PointArrayLiteral</a></li><li><a href="global.html#PointBoundsArrayLiteral">PointBoundsArrayLiteral</a></li><li><a href="global.html#PointBoundsLiteral">PointBoundsLiteral</a></li><li><a href="global.html#PointBoundsObjectLiteral">PointBoundsObjectLiteral</a></li><li><a href="global.html#PointerEvent">PointerEvent</a></li><li><a href="global.html#PointLiteral">PointLiteral</a></li><li><a href="global.html#PointObjectLiteral">PointObjectLiteral</a></li><li><a href="global.html#SizeArrayLiteral">SizeArrayLiteral</a></li><li><a href="global.html#SizeLiteral">SizeLiteral</a></li><li><a href="global.html#SizeObjectLiteral">SizeObjectLiteral</a></li><li><a href="global.html#string">string</a></li><li><a href="global.html#TransitionOptions">TransitionOptions</a></li>
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="modules.list.html" itemprop="mainEntityOfPage" class="dropdown-toggle dropdown-toggle-modules" data-toggle="dropdown">Modules<b class="caret"></b></a>
                    <ul class="dropdown-menu ">
                        
                        <li><a href="module-drawing.html">drawing</a></li><li><a href="module-geocoder.html">geocoder</a></li><li><a href="module-panorama.html">panorama</a></li><li><a href="module-visualization.html">visualization</a></li>
                    </ul>
                </li>
               
                
                
            </ul>
            <div id="_searchbox" class="col-sm-3 col-md-3">
                <form class="navbar-form" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="검색" name="q" id="search-input">
                        <div class="input-group-btn">
                            <button class="btn btn-default" id="search-submit">
                                <!-- <i class="glyphicon glyphicon-search"></i> -->
                                <img src="./img/icon_search-ncp.png" width="14px" height="14px" alt="">
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="navbar-footer">
        <div class="container">
            <div class="navbar-footer-wrapper">
            
                <a href="https://github.com/navermaps/maps.js.ncp">포크하기</a>
            
                <a href="https://www.ncloud.com/support/question/service">문의하기</a>
            
                <a href="https://www.ncloud.com/">네이버 클라우드 플랫폼 바로가기</a>
            
                <a href="https://www.ncloud.com/support/notice">공지사항 바로가기</a>
            
            </div>
        </div>
    </div>
</div>


<div class="container" id="toc-content">
<div class="row">

    
    <div class="col-md-12">
    
        <div id="main" itemscope itemtype="https://schema.org/TechArticle">
            <div style="display:none;">
                <div itemprop="image" itemscope, itemtype="http://schema.org/ImageObject">
                    <meta itemprop="thumbnailUrl" content="./img/logo_200x200.png">
                    <img src="./img/logo_200x200.png" alt="logo">
                </div>
                <div>
                    <a href="tutorial-0-Getting-Started.html" itemprop="mainEntityOfPage">Tutorials</a>
                    <a href="tutorial-digest.example.html" itemprop="mainEntityOfPage">Examples</a>
                    <span itemprop="keywords">naver</span>
                    <span itemprop="keywords">map</span>
                    <span itemprop="keywords">js</span>
                    <span itemprop="keywords">api</span>
                    <span itemprop="keywords">v3</span>
                    <span itemprop="keywords">네이버 지도 API</span>
                    <span itemprop="keywords">좌표계 변환하기</span>
                </div>
            </div>
            <script src="./js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="./js/base.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=83bfuniegk&amp;submodules=panorama,geocoder,drawing,visualization"></script>
<link rel="stylesheet" type="text/css" href="./css/base.css" />

<section class="tutorial-section">
<header></header>
<article>
    

    <h1>좌표계 변환하기</h1>

    

<!--  -->

<div id="wrap" class="section">
    <h2>좌표계 변환하기</h2>
    <p>Geocoder 서브 모듈의 TransCoord 객체를 사용한 좌표계 변환 예제입니다.</p>
    <div id="map" style="width:100%;height:600px;"></div>
    <code id="snippet" class="snippet"></code>
</div>

<script id="code">
var map = new naver.maps.Map("map", {
        center: new naver.maps.LatLng(37.5666103, 126.9783882),
        zoom: 16
    }),
    infoWindow = null;

function initGeocoder() {
    var latlng = map.getCenter();
    var utmk = naver.maps.TransCoord.fromLatLngToUTMK(latlng); // 위/경도 -> UTMK
    var tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk);   // UTMK -> TM128
    var naverCoord = naver.maps.TransCoord.fromTM128ToNaver(tm128); // TM128 -> NAVER

    infoWindow = new naver.maps.InfoWindow({
        content: ''
    });

    map.addListener('click', function(e) {
        var latlng = e.coord,
            utmk = naver.maps.TransCoord.fromLatLngToUTMK(latlng),
            tm128 = naver.maps.TransCoord.fromUTMKToTM128(utmk),
            naverCoord = naver.maps.TransCoord.fromTM128ToNaver(tm128);

        utmk.x = parseFloat(utmk.x.toFixed(1));
        utmk.y = parseFloat(utmk.y.toFixed(1));

        infoWindow.setContent([
            '<div style="padding:10px;width:380px;font-size:14px;line-height:20px;">',
            '<strong>LatLng</strong> : '+ '좌 클릭 지점 위/경도 좌표' +'<br />',
            '<strong>UTMK</strong> : '+ '위/경도 좌표를 UTMK 좌표로 변환한 값' +'<br />',
            '<strong>TM128</strong> : '+ '변환된 UTMK 좌표를 TM128 좌표로 변환한 값' +'<br />',
            '<strong>NAVER</strong> : '+ '변환된 TM128 좌표를 NAVER 좌표로 변환한 값' +'<br />',
            '</div>'
        ].join(''));

        infoWindow.open(map, latlng);
        console.log('LatLng: ' + latlng.toString());
        console.log('UTMK: ' + utmk.toString());
        console.log('TM128: ' + tm128.toString());
        console.log('NAVER: ' + naverCoord.toString());
    });
}

naver.maps.onJSContentLoaded = initGeocoder;
</script>



    
</article>

</section>

        </div>
    </div>

    <div class="clearfix"></div>

    

</div>
</div>

<div class="modal fade" id="searchResults">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Search results</h4>
      </div>
      <div class="modal-body"></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>

<div class="footer">


    <span class="copyright">
    <a href="https://developers.naver.com">NAVER Developers</a> | Copyright 2016 NAVER Corp. All rights reserved. | <a href="http://developer.naver.com/wiki/pages/mapAgreement">Terms of Service</a>
    </span>

<span class="jsdoc-message">
    Documentation generated by <a href="https://github.com/jsdoc3/jsdoc">JSDoc 3.6.11</a>
    
    using the <a href="https://github.com/docstrap/docstrap">DocStrap template</a>.
</span>
</div>

<!--[if lt IE 9]>
<script src="scripts/iron.js"></script>
<script src="scripts/respond.min.js"></script>
<script src="scripts/docstrap.lib.ie8.js"></script>
<script type="text/javascript">
    var isTocSupported = false;
    var isSearchSupported = false;
    function remove(itm) {
        itm && itm.parentElement.removeChild(itm);
    }
    remove(document.getElementById('toc'));
    remove(document.getElementById('_searchbox'));
</script>
<![endif]-->


<!--[if gt IE 8]> <!-- -->
<script src="scripts/docstrap.lib.js"></script>
<script id="__toc" src="scripts/toc.js"></script>
<script type="text/javascript" src="scripts/fulltext-search-ui.js"></script>
<script type="text/javascript">
    var isTocSupported = true;
    var isSearchSupported = true;
</script>
<!-- <![endif]-->

<script src="./js/highlight.min.js"></script>

<script>
$( function () {
    $( "[id*='$']" ).each( function () {
        var $this = $( this );

        $this.attr( "id", $this.attr( "id" ).replace( "$", "__" ) );
    } );


    $('pre').each(function(i, block) {
        hljs.highlightBlock(block);
    });

    if (isTocSupported) {
        $.catchAnchorLinks( {
            navbarOffset: 10
        } );

        $( "#toc" ).toc( {
            anchorName  : function ( i, heading, prefix ) {
                var id = $( heading ).attr( "id" );
                return id && id.replace(/\~/g, '-inner-').replace(/\./g, '-static-') || ( prefix + i );
            },
            selectors   : "#toc-content h1,#toc-content h2,#toc-content h3,#toc-content h4",
            showAndHide : false,
            smoothScrolling: true
        } );
    }

    $( "#main span[id^='toc']" ).addClass( "toc-shim" );
    $( '.dropdown-toggle' ).dropdown();
    $( "table" ).each( function () {
      var $this = $( this );
      $this.addClass('table');
    } );
    $("#main>section:not('.tutorial-section')").localScroll({
        offset: {
            top: -170 //offset by the height of your header (give or take a few px, see what works for you)
        }
    });
} );
</script>

<script type="text/javascript">
    if (isSearchSupported) {
        $(document).ready(function() {
            SearcherDisplay.init();

            var w = $(window);
            $('.dropdown-menu').on('mousewheel', function(e, d) {
                var t = $(this),
                    up = e.originalEvent.deltaY < 0;

                if (w.width() < 768) return;

                if (up) {
                    if (t.scrollTop() === 0) e.preventDefault();
                } else {
                    if (t.scrollTop() == t.get(0).scrollHeight - t.innerHeight()) e.preventDefault();
                }
            })
        });
    }
</script>

<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
    if (!wcs_add) var wcs_add = {};
    wcs_add["wa"] = "53b18ad34ed198";
    wcs_do();
</script>
</body>
</html>