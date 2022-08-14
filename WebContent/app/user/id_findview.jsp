<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"
    />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="author" content="webstoryboy" />
    <meta
      name="description"
      content="메가박스 사이트를 모티브로 삼은 메가한조 웹사이트입니다."
    />
    <meta
      name="keywords"
      content="메가박스, 유투브, 영화, 최신영화, 영화관, CGV, 롯데시네마, 웹스토리보이, 웹스, 사이트 만들기, 따라하기, 이미지 슬라이드"
    />
    <title>메가한조</title>

    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/app/user/assets/css/swiper.css" />

    <!-- 파비콘 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/app/user/assets/icons/favicon.ico" />
    <link
      rel="apple-touch-icon-precomposed"
      href="${pageContext.request.contextPath}/app/user/assets/icons/favicon_72.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="96x96"
      href="${pageContext.request.contextPath}/app/user/assets/icons/favicon_96.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="144x144"
      href="${pageContext.request.contextPath}/app/user/assets/icons/favicon_144.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="192x192"
      href="${pageContext.request.contextPath}/app/user/assets/icons/favicon_192.png"
    />

    <!-- 페이스북 메타 태그 -->
    <meta property="og:title" content="메가박스 사이트 만들기" />
    <meta
      property="og:url"
      content="https://github.com/webstoryboy/megabox2019"
    />
    <meta
      property="og:image"
      content="https://webstoryboy.github.io/megabox2019/mega.jpg"
    />
    <meta
      property="og:description"
      content="메가박스 사이트 따라하면서 배우는 튜토리얼입니다."
    />

    <!-- 트위터 메타 태그 -->
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:title" content="메가박스 사이트 만들기" />
    <meta
      name="twitter:url"
      content="https://github.com/webstoryboy/megabox2019/"
    />
    <meta
      name="twitter:image"
      content="https://webstoryboy.github.io/megabox2019/mega.jpg"
    />
    <meta
      name="twitter:description"
      content="메가박스 사이트 따라하면서 배우는 튜토리얼입니다."
    />

    <!-- 웹 폰트 -->
    <link
      href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
      rel="stylesheet"
    />
<style>
	body{
		background-color:rgb(245,246,247);
	}
	#wrap{
		width:300px;
		margin:0 auto;
		margin-top: 110px;
		height: 460px;
	}
	#wrap > tr, #wrap > td{
		padding:10px;
	}
	#wrap > tr{
		width:200px;
	}
	#wrap > td{
		width:350px;
	}
	input[type=text], input[type=password]{
		padding:10px;
		width:200px;
		margin-left:20px;
		border:1px solid #ccc;
		outline:none;
	}
	input[type=submit]{
		margin-top:10px;
		padding:10px 20px;
		width:150px;
		border:none;
		background-color:#6e40c4;
		border-radius:5px;
		color:#fff;
		font-weight:bold;
		font-size:16px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 20px;
	}
	input[type=button]{
		text-align: center;
		margin-top:30px;
		padding:10px 20px;
		width:100px;
		border:none;
		background-color:#6e40c4;
		border-radius:5px;
		color:#fff;
		font-weight:bold;
		font-size:16px;
	}
	#sub_area{
		text-align: center;
		padding:10px 20px;
		margin: 20px;
		font-size: 13px;
	}
	
</style>

</head>

<body>
  	<c:set var="cp" value="${pageContext.request.contextPath}"/>
  	<from name="id_findFrom" method="post" action="${c}/user/Id_FindOk.us" onsubmit="return sendit();">
	<header id="header">
      <div class="container">
        <div class="row">
          <div class="header clearfix">
            <h1>
              <a href="${pageContext.request.contextPath}/">
                <em><img src="${pageContext.request.contextPath}/app/user/assets/img/logo.png" alt="MEGAHANZO" /></em>
                <strong
                  ><img src="${pageContext.request.contextPath}/app/user/assets/img/logo-sub.png" alt="LIFE THEATER"
                /></strong>
              </a>
            </h1>
            <nav id="mNav">
              <h2 class="ir_so">메가한조 전체메뉴</h2>
              <a href="#" class="ham"><span></span></a>
            </nav>
          </div>
        </div>
      </div>
    </header>
    <div id="wrap">
	<form name="id_findForm" method="post" action="${cp}/user/Id_FindOK.us" onsubmit="return sendit();">
     <table>
    	<tr>
    		<th><label for="userid">이름</label></th>
    		<td><input type="text" name="username" id="username" placeholder="이름">
    	</tr>
    	<tr>
    		<th><label for="userphone">전화번호</label></th>
    		<td><input type="text" name="userphone" id="userphone" placeholder="전화번호">
    	</tr>
    	<tr>
    		<th colspan="2">
    			<input type="submit" value="아이디 찾기">
     </table>
    	<div  id="sub_area" class="sub_area">
			<div class="look_box">
			<a class="1" href="${cp}/user/Id_Find.us" class="link look" data-clk="log_off.searchid" style="color: purple;font-weight: bold; ">아이디 찾기</a>
    		<a>/</a>
			<a class="2" href="${cp}/user/Pw_Find.us" class="link look" data-clk="log_off.searchid">비밀번호 찾기</a>
    		<a>/</a>
			<a class="3" href="http://localhost:9090/app/user/joinagree.jsp" class="link look" data-clk="log_off.join">회원가입</a>
    		</div>
    		</div>
    </form>
    </div>

	
	
</body>
<script>let cp = "${pageContext.request.contextPath}";</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${cp}/app/user/user.js"></script>	
</html>






