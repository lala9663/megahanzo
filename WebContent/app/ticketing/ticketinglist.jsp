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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/app/ticketing/assets/css/reset.css" />
       <link rel="stylesheet" href="${pageContext.request.contextPath}/app/ticketing/assets/css/style.css" />
       <link rel="stylesheet" href="${pageContext.request.contextPath}/app/ticketing/assets/css/tistyle.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/app/ticketing/assets/css/swiper.css" />

    <!-- 파비콘 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/app/ticketing/assets/icons/favicon.ico" />
    <link
      rel="apple-touch-icon-precomposed"
      href="${pageContext.request.contextPath}/app/movie/assets/icons/favicon_72.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="96x96"
      href="${pageContext.request.contextPath}/app/movie/assets/icons/favicon_96.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="144x144"
      href="${pageContext.request.contextPath}/app/movie/assets/icons/favicon_144.png"
    />
    <link
      rel="apple-touch-icon-precomposed"
      sizes="192x192"
      href="${pageContext.request.contextPath}/app/movie/assets/icons/favicon_192.png"
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
         height: 100vh;
         background-image: url('${pageContext.request.contextPath}/app/ticketing/assets/img/movie.jpg');
             background-repeat : no-repeat;
             background-size : cover;
      }
   #bu{
         text-align: center;
         padding:10px 20px;
         width:100px;
         border:none;
         background-color:#6e40c4;
         border-radius:5px;
         color:#fff;
         font-weight:bold;
         font-size:14px;
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
    <header id="header">
      <div class="container">
        <div class="row">
          <div class="header clearfix">
            <h1>
              <a href="${pageContext.request.contextPath}/">
                <em><img src="${pageContext.request.contextPath}/app/ticketing/assets/img/logo.png" alt="MEGAHANZO" /></em>
                <strong
                  ><img src="${pageContext.request.contextPath}/app/ticketing/assets/img/logo-sub.png" alt="LIFE THEATER"
                /></strong>
              </a>
            </h1>
            <nav id="mNav">
              <h2 class="ir_so">메가한조 전체메뉴</h2>
              <a href="#" class="ham"><span></span></a>
            </nav>
            <nav class="nav">
              <ul class="clearfix" id="nav">
                 <c:choose>
                    <c:when test="${loginUser.useradmin == 0}">
                       <c:if test="${loginUser != null and loginUser.userid != 'admin'}">
                     <li><a href="${cp }/movie/MovieListByRate.mo">영화</a></li>
                  </c:if>
                      <c:if test="${loginUser != null and loginUser.userid != 'admin'}">
                     <li><a href="${cp }/ticketing/TicketingMovieSelect.ti">예매</a></li>
                  </c:if>
                      <c:if test="${loginUser.userid != 'admin'}">
                     <li><a href="${cp }/board/Board.bo">게시판</a></li>
                  </c:if>
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
                  </c:if>
                      <c:if test="${loginUser == null}">
                     <li><a href="${cp}/user/UserLogin.us">로그인</a></li>
                  </c:if>
                      <c:if test="${loginUser != null}">
                     <li><a href="${cp}/user/UserLogoutOk.us">로그아웃</a></li>
                  </c:if>
                    </c:otherwise>
                 </c:choose>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </header>
    <form id="seatForm" method="post" name="seatForm" action="${cp}/ticketing/TicketingReserveOk.ti?movietitle=${movietitle}">
           <div class="movie-container">
      <label>영화를 선택해주세요 : </label>
      <c:set var="curr_movie" value=""/>
      <select id="ticket-movie" onchange="tlform();" name="ticketmovie">
         <c:choose>
         <c:when test="${movieList != null and movieList.size()>0}">
            <c:forEach begin="0" end="${movieList.size()-1}" step="1" var="i">
               <c:set var="movie" value="${movieList[i]}" />
               <option id="${movie.movietitle}" value="10000"
               <c:if test="${i==0}">
                  selected
               </c:if>
               >${movie.movietitle} (10000₩)</option>
            </c:forEach>
         </c:when>
         <c:otherwise>
            <option value="0" selected>등록된 영화가 없습니다</option>
         </c:otherwise>
      </c:choose>
      </select>
      <select id="ticket-time" name="tickettime">
         <c:choose>
         <c:when test="${timeList != null and timeList.size()>0}">
            <c:forEach begin="0" end="${timeList.size()-1}" step="1" var="i">
               <c:forEach begin="0" end="${movieList.size()-1}" step="1" var="j">
                  <c:set var="movie" value="${movieList[j]}" />
                  <c:set var="time" value="${timeList[i]}" />
                  <c:if test="${movie.movietitle == time.movietitle}">
                     <option id="${time.movietitle}" value="${time.timeid}"
                        <c:if test="${i==0}">
                           selected
                        </c:if>
                     >${time.starttime} ~ ${time.endtime} &nbsp;&nbsp;</option>
                  </c:if>
               </c:forEach>
            </c:forEach>
         </c:when>
         <c:otherwise>
            <option value="0" selected>등록된 상영시간이 없습니다</option>
         </c:otherwise>
      </c:choose>
      </select>
    </div>
    


    <ul class="showcase">
      <li>
        <div class="seat"></div>
        <small>N/A</small>
      </li>

      <li>
        <div class="seat selected"></div>
        <small>선택하신 좌석</small>
      </li>

      <li>
        <div class="seat occupied"></div>
        <small>이미 예매된 좌석</small>
      </li>
    </ul>

    <div class="seat-container">
      <div class="screen"></div>
      <c:forEach begin="0" end="9" step="1" var="i">
         <div class="seat-row">
          <c:forEach begin="0" end="9" step="1" var="j">
               <input type="button" class="seat 
               <c:if test="${seat.seatoccupied == 1}">occupied</c:if>" id="seat${i*10+j+1}" />
          </c:forEach>
       </div>
      </c:forEach>
    </div>
    </form>

    <p class="text">
         총 <span id="seat-count">0</span> 개의 좌석을 ₩ <span id="price-total">0</span> 원 에 예매하시겠습니까?
    </p>
    
    <button onclick="location.href='${cp}/ticketing/TicketingComplete.ti';" id="bu">예매하기</button>
    
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