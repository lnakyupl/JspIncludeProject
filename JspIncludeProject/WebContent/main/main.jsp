<%@page import="com.sist.change.JspChange"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String mode = request.getParameter("mode");
	if (mode == null)
		mode = "0";
	int no = Integer.parseInt(mode);
	String jsp = JspChange.change(no);
%>
<!DOCTYPE HTML>
<html>
<head>
<title>서울 여행 코스</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assets/css/main.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

<!-- <script src="../js/jquery.easing.1.3.js"></script>
<script type="text/javascript">
$(function() {

	//Custom settings
	var style_in = 'easeOutBounce';
	var style_out = 'jswing';
	var speed_in = 1000;
	var speed_out = 300;


	//Calculation for corners
	var neg = Math.round($('.qitem').width() / 2) * (-1);
	var pos = neg * (-1);
	var out = pos * 2;
	
	var wneg = Math.round($('.qitem').width() / 2) * (-1);
	var wpos = wneg * (-1);
	
	var hneg = Math.round($('.qitem').height() / 2) * (-1);
	var hpos = hneg * (-1);
	
	$('.qitem').each(function () {
	
		url = $(this).find('a').attr('href');
		img = $(this).find('img').attr('src');
		alt = $(this).find('img').attr('img');
		
		$('img', this).remove();
		$(this).append('<div class="topLeft"></div><div class="topRight"></div><div class="bottomLeft"></div><div class="bottomRight"></div>');
		$(this).children('div').css('background-image','url('+ img + ')');
		$(this).children('div').css('background-size','150px 120px');

		$(this).find('div.topLeft').css({top:0, left:0, width:wpos , height:hpos});	
		$(this).find('div.topRight').css({top:0, left:wpos, width:wpos , height:hpos});	
		$(this).find('div.bottomLeft').css({bottom:0, left:0, width:wpos , height:hpos});	
		$(this).find('div.bottomRight').css({bottom:0, left:wpos, width:wpos , height:hpos});	

	}).hover(function () {
	
		$(this).find('div.topLeft').stop(false, true).animate({top:wneg, left:hneg}, {duration:speed_out, easing:style_out});	
		$(this).find('div.topRight').stop(false, true).animate({top:wneg, left:out}, {duration:speed_out, easing:style_out});	
		$(this).find('div.bottomLeft').stop(false, true).animate({bottom:wneg, left:hneg}, {duration:speed_out, easing:style_out});	
		$(this).find('div.bottomRight').stop(false, true).animate({bottom:wneg, left:out}, {duration:speed_out, easing:style_out});	
				
	},
	
	function () {

		$(this).find('div.topLeft').stop(false, true).animate({top:0, left:0}, {duration:speed_in, easing:style_in});	
		$(this).find('div.topRight').stop(false, true).animate({top:0, left:wpos}, {duration:speed_in, easing:style_in});	
		$(this).find('div.bottomLeft').stop(false, true).animate({bottom:0, left:0}, {duration:speed_in, easing:style_in});	
		$(this).find('div.bottomRight').stop(false, true).animate({bottom:0, left:wpos}, {duration:speed_in, easing:style_in});	
	
	}).click (function () {
		window.location = $(this).find('a').attr('href');	
	});	

});
</script> -->

<style>
	.qitem {
		width:150px;
		height:120px;	
		border:2px solid #222;	
		margin:5px 5px 5px 0;
		background: url('../foodhouse/bg.gif') no-repeat; 
		
		
		/* required to hide the image after resized */
		overflow:hidden;
		
		/* for child absolute position */
		position:relative;
		
		/* display div in line */
		float:left;
		cursor:hand; cursor:pointer;
	}

	.qitem img {
		border:0;
	
		/* allow javascript moves the img position*/
		position:absolute;
		z-index:200;
	}

	.qitem .caption {
		position:absolute;
		z-index:0;	
		color:#ccc;
		display:block;
		height: 100%;
		line-height: 22px;
		width: 100%;
		text-align: center;
		vertical-align: middle;
	}

	.qitem .caption h4 {
		font-size:15px;
		padding:10px 5px 0 8px;
		margin:0;
		color:#369ead;
	}

	.qitem .caption p {
		font-size:12px;	
		padding:3px 5px 0 8px;
		margin:0;
	}


	/* Setting for corners */

	.topLeft, .topRight, .bottomLeft, .bottomRight {
		position:absolute;
		background-repeat: no-repeat; 
		float:left;
	}
	
	.topLeft {
		background-position: top left; 	
	} 
	
	.topRight {
		background-position: top right; 
	} 
	
	.bottomLeft {
		background-position: bottom left; 
	} 
	
	.bottomRight {
		background-position: bottom right; 
	}
	
	.clear {
		clear:both;	
	}
</style>


</head>
<body>
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header-wrapper">
			<!-- header첨부(메뉴) -->
			<jsp:include page="header.jsp"></jsp:include>

		</div>

		<!-- content -->
		<jsp:include page="<%=jsp%>"></jsp:include>
		<!-- content end -->
		<!-- Footer -->
		<div id="footer-wrapper">
			<!-- footer 첨부 -->
			<%@ include file="footer.jsp"%>
		</div>

		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/skel.min.js"></script>
		<script src="assets/js/skel-viewport.min.js"></script>
		<script src="assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="assets/js/main.js"></script>
</body>
</html>