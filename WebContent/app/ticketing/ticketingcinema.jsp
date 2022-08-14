<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/swiper.css" />

    <!-- 파비콘 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/icons/favicon.ico" />
    <link
      rel="apple-touch-icon-precomposed"
      href="${pageContext.request.contextPath}/assets/icons/favicon_72.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="96x96"
      href="${pageContext.request.contextPath}/assets/icons/favicon_96.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="144x144"
      href="${pageContext.request.contextPath}/assets/icons/favicon_144.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="192x192"
      href="${pageContext.request.contextPath}/assets/icons/favicon_192.png"
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

    <!-- HTLM5shiv ie6~8 -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.min.js"></script>
      <script type="text/javascript">
        alert(
          "현재 브라우저는 지원하지 않습니다. 크롬 브라우저를 추천합니다.!"
        );
      </script>
    <![endif]-->
<style>
   body{
      background-color:rgb(245,246,247);
   }
   #list_wrap{
      width:300px;
      margin:0 auto;
      margin-top: 100px !important;
      height: 460px;
   }
   #list_wrap > tr, #list_wrap > td{
      padding:10px;
   }
   #list_wrap > tr{
      width:200px;
   }
   #list_wrap > td{
      width:350px;
   }
   .title{
      width: 100%;
      font-weight:bold;
      font-size:18px;
   }
   .title_1{
   
   }
   input[type=text], input[type=password]{
      padding:10px;
      width:200px;
      margin-left:20px;
      border:1px solid #ccc;
      outline:none;
   }
   input[type=submit]{
      margin-top:30px;
      padding:10px 20px;
      width:100px;
      border:none;
      background-color:#6e40c4;
      border-radius:5px;
      color:#fff;
      font-weight:bold;
      font-size:18px;
   }
   input[type=button]{
      text-align: center;
      margin-top:30px;
      padding:10px 20px;
      border:none;
      background-color:#6e40c4;
      border-radius:5px;
      color:#fff;
      font-weight:bold;
      font-size:18px;
   }
</style>
</head>
<body>
   <c:set var="cp" value="${pageContext.request.contextPath}"/>
   <c:if test="${loginUser == null }">
      <script>
           alert("로그인 후 이용하세요!");
          location.replace("${pageContext.request.contextPath}/user/UserLogin.us");
       </script>
   </c:if>
   <c:if test="${loginUser != null and loginUser.userid != 'admin'}">
      <script>
          alert("접근 권한이 없습니다!"); 
          location.replace("${pageContext.request.contextPath}/user/UserLogoutOk.us");
       </script> 
   </c:if>
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
            <nav class="nav">
              <ul class="clearfix" id="nav">
                 <li><a href="${cp}/movie/MovieListByRate.mo">영화관리</a></li>
                <c:if test="${loginUser.userid == 'admin'}">
               <li><a href="${cp}/user/UserList.us">회원관리</a></li>
               <li><a href="${cp}/ticketing/TicketingCinema.ti">극장관리</a></li>
            </c:if>
            <li><a href="${cp }/board/Board.bo">게시판</a></li>
                <c:if test="${loginUser == null}">
               <li><a href="${cp}/user/UserLogin.us">로그인</a></li>
            </c:if>
                <c:if test="${loginUser != null}">
               <li><a href="${cp}/user/UserLogoutOk.us">로그아웃</a></li>
            </c:if>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </header>
    <!-- //header -->
   
   <c:if test="${not empty param.a }">
      <c:if test="${param.a == 'f' }">
         <script>
            alert("상영관 추가 실패! 다음에 다시 시도해주세요.");
         </script>
      </c:if>
      <c:if test="${param.a == 't' }">
         <script>
            alert("상영관 추가 성공!");
         </script>
      </c:if>
   </c:if>
   
   <c:if test="${not empty param.r }">
      <c:if test="${param.r == 'f' }">
         <script>
            alert("상영관 삭제 실패! 다음에 다시 시도해주세요.");
         </script>
      </c:if>
      <c:if test="${param.r == 't' }">
         <script>
            alert("상영관 삭제 성공!");
         </script>
      </c:if>
   </c:if>
   <div style="margin:0 auto;" id="list_wrap" align="center">
      
      <!-- 타이틀과 글 개수 띄워주는 테이블 -->
      <table class="title">
         <tr height="50px" align="center" valign="middle" id="1">
            <td><font size="6" >&lt;상영관&gt;</font></td>
         </tr>
         <tr height="50px" align="center" valign="middle" id="2">
            <td>현재 상영관 숫자 : <font color="purple"> ${totalcinema}</font></td>
         </tr>
      </table>
      
      <!-- 타이틀과 글 개수 띄워주는 테이블 -->
      <table>
         <tr align="center">
            <th colspan="2">
               <input type="button" value="상영관추가" onclick="location.href='${cp}/ticketing/TicketingCinemaAddOk.ti?totalcinema=${totalcinema}';">
               <input type="button" value="상영관삭제" onclick="location.href='${cp}/ticketing/TicketingCinemaRemoveOk.ti?totalcinema=${totalcinema}';">
            </th>
         </tr>
      </table>
      
   </div>
   
     <footer id="footer">
      <div id="footer_sns">
        <div class="container">
          <div class="footer_sns">
            <div class="tel">
              <a href="#">ARS <em>1544-0070</em></a>
            </div>
          </div>
        </div>
      </div>
      <div id="footer_infor">
        <div class="container">
          <div class="row">
            <div class="footer_infor">
              <h2><img src="${pageContext.request.contextPath}/app/movie/assets/img/logo_footer.png" alt="megabox" /></h2>
              <ul>
                <c:choose>
		              		<c:when test="${loginUser.useradmin == 0 }">
		              			<c:if test="${loginUser.userid != 'admin'}">
									<li><a href="${cp }/movie/MovieList.mo">영화</a></li>
								</c:if>
		                		<c:if test="${loginUser.userid != 'admin'}">
									<li><a href="${cp }/ticketing/TicketingList.ti">예매</a></li>
								</c:if>
		 		               <li><a href="${cp }/board/Board.bo">게시판</a></li>
								<c:if test="${loginUser != null and loginUser.userid != 'admin'}">
									<li><a href="${cp }/movie/ReviewList.mo?useradmin=${loginUser.useradmin}">리뷰</a></li>
								</c:if>
								<c:if test="${loginUser != null and loginUser.userid != 'admin'}">
									<li><a href="${cp}/user/UserMypage.us?useradmin=${loginUser.useradmin}">내정보</a></li>
								</c:if>
								<c:if test="${loginUser.userid == 'admin' or loginUser.useradmin == 1}">
									<li><a href="${cp}/user/UserAdmin.us">ADMIN</a></li>
								</c:if>
		        		        <c:if test="${loginUser == null}">
									<li><a href="${cp}/user/UserLogin.us">로그인</a></li>
								</c:if>
		                		<c:if test="${loginUser != null}">
									<li><a href="${cp}/user/UserLogoutOk.us">로그아웃</a></li>
								</c:if>
		              		</c:when>
		              		<c:otherwise>
              			<li><a href="${cp}/movie/MovieListByRate.mo">영화관리</a></li>
                		<c:if test="${loginUser.userid == 'admin'}">
							<li><a href="${cp}/user/UserList.us">회원관리</a></li>
							<li><a href="${cp}/ticketing/TicketingCinema.ti">극장관리</a></li>
						</c:if>
						<li><a href="${cp }/board/Board.bo">게시판</a></li>
                		<c:if test="${loginUser == null}">
							<li><a href="${cp}/user/UserLogin.us">로그인</a></li>
						</c:if>
                		<c:if test="${loginUser != null}">
							<li><a href="${cp}/user/UserLogoutOk.us">로그아웃</a></li>
						</c:if>
              		</c:otherwise>
		              	</c:choose>
              </ul>
              <address>
                <p>
                  서울특별시 강남구 도산대로 156, 2층 메가박스중앙(주) (논현동,
                  중앙엠앤비사옥)<br /><span class="bar2">대표자명 안호진</span>
                  개인정보보호 책임자 경영지원실 실장 박영진<br /><span
                    class="bar2"
                    >사업자등록번호 211-86-59478</span
                  >
                  통신판매업신고번호 제 833호
                </p>
                <p>Copyright 2022 by MegaboxJoongAng Inc. All right reserved</p>
              </address>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- //footer -->
   
</body>
</html>      
      
      
      







