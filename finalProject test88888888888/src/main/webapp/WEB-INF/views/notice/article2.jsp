<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="shortcut icon"
	href="https://www.megabox.co.kr/static/pc/images/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>MEET PLAY SHARE, 메가박스</title>

<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/list.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/main_files/megabox.min.css" media="all">


<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		
		str = f.subject.value;
		str = str.trim();
		if(!str){
			alert("\n제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		f.subject.value = str;
		
		str = f.name.value;
		str = str.trim();
		if(!str){
			alert("\n이름을 입력하세요.");
			f.name.focus();
			return;
		}		
		
		/* if(!isValidKorean(str)){
			alert("\n이름을 정확히 입력하세요.");
			f.name.focus()
			return;
		}	*/	
		f.name.value = str;
		
		if(f.email.value){
			if(!isValidEmail(f.email.value)){
				alert("\n정상적인 E-Mail을 입력하세요.");
				f.email.focus();
				return;
			}
		}
		
		str = f.content.value;
		str = str.trim();
		if(!str){
			alert("\n내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.content.value = str;
		
		str = f.pwd.value;
		str = str.trim();
		if(!str){
			alert("\n패스워드를 입력하세요.");
			f.pwd.focus();
			return;
		}
		f.pwd.value = str;
		
		f.action = "<%=cp%>/movie/created";
		f.submit();
		
	}

</script>


</head>
<body>

	<!-- header -->
	<header id="header">
	<h1 class="ci">
		<a href="http://localhost:8080/main" title="MEGABOX 메인으로 가기">MEGABOX
			: Life Theater</a>
	</h1>




	<!-- 2019-04-15 마크업 수정 : 고객요청  -->
	<div class="util-area">
		<div class="left-link">
			<a href="https://www.megabox.co.kr/benefit/viplounge"
				title="VIP LOUNGE">VIP LOUNGE</a> <a
				href="https://www.megabox.co.kr/benefit/membership" title="멤버십">멤버십</a>
			<a href="http://localhost:8080/movie/list" title="고객센터">고객센터</a>
		</div>

		<div class="right-link">

			<c:choose>

				<c:when test="${empty sessionScope.customInfo.id }">
					<a href="<%=cp%>/movie/login" title="로그인">로그인</a>
					<a href="<%=cp%>/movie/join" title="회원가입">회원가입</a>
				</c:when>

				<c:otherwise>
					<a href="">${sessionScope.customInfo.id }님</a>
					<a href="<%=cp%>/movie/logout" title="로그아웃">로그아웃</a>
					<a href="<%=cp%>/movie/mypage" title="마이페이지">마이페이지</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


	<div class="link-area">
		<a href="https://www.megabox.co.kr/support/notice#layer_sitemap"
			class="header-open-layer btn-layer-sitemap" title="사이트맵">사이트맵</a> <a
			href="https://www.megabox.co.kr/support/notice#layer_header_search"
			class="header-open-layer btn-layer-search" title="검색">검색</a> <a
			href="https://www.megabox.co.kr/booking/timetable"
			class="link-ticket" title="상영시간표">상영시간표</a> <a
			href="https://www.megabox.co.kr/support/notice#layer_mymega"
			class="header-open-layer btn-layer-mymega" title="나의 메가박스">나의
			메가박스</a>
	</div>


	<nav id="gnb">
	<ul class="gnb-depth1">
		<li><a href="https://www.megabox.co.kr/movie"
			class="gnb-txt-movie" title="영화">영화</a>
			<div class="gnb-depth2">
				<ul>
					<li><a href="https://www.megabox.co.kr/movie" title="전체영화">전체영화</a></li>


					<li><a
						href="https://www.megabox.co.kr/curation/specialcontent"
						title="큐레이션">큐레이션</a></li>

					<li id="festivalArea" style="display: none;"><a
						href="https://www.megabox.co.kr/festival" title="영화제">영화제</a></li>
					<li><a href="https://www.megabox.co.kr/moviepost/all"
						title="무비포스트">무비포스트</a></li>
				</ul>
			</div></li>
		<li><a href="http://localhost:8080/booking_1"
			class="gnb-txt-reserve" title="예매">예매</a>
			<div class="gnb-depth2">
				<ul>
					<li><a href="https://www.megabox.co.kr/booking" title="빠른예매">빠른예매</a></li>
					<li><a href="https://www.megabox.co.kr/booking/timetable"
						title="상영시간표">상영시간표</a></li>
					<li><a href="https://www.megabox.co.kr/booking/privatebooking"
						title="더 부티크 프라이빗 예매">더 부티크 프라이빗 예매</a></li>
				</ul>
			</div></li>
		<li><a href="https://www.megabox.co.kr/theater/list"
			class="gnb-txt-theater" title="극장">극장</a>
			<div class="gnb-depth2">
				<ul>
					<li><a href="https://www.megabox.co.kr/theater/list"
						title="전체극장">전체극장</a></li>
					<li><a href="https://www.megabox.co.kr/specialtheater/list"
						title="특별관">특별관</a></li>
				</ul>
			</div></li>
		<li><a href="javascript:void(0)"
			onclick="NetfunnelChk.aTag(&#39;EVENT_LIST&#39;,&#39;/event&#39;);return false;"
			class="gnb-txt-event" title="이벤트">이벤트</a>
			<div class="gnb-depth2">
				<ul>
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag(&#39;EVENT_LIST&#39;,&#39;/event&#39;);return false;"
						title="진행중 이벤트">진행중 이벤트</a></li>
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag(&#39;EVENT_LIST&#39;,&#39;/event/end&#39;);return false;"
						title="지난 이벤트">지난 이벤트</a></li>
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag(&#39;EVENT_LIST&#39;,&#39;/event/winner/list&#39;);return false;"
						title="당첨자발표">당첨자발표</a></li>
				</ul>
			</div></li>
		<li><a href="javascript:void(0)"
			onclick="NetfunnelChk.aTag(&#39;STORE_LIST&#39;,&#39;/store&#39;);return false;"
			class="gnb-txt-store" title="스토어">스토어</a></li>
		<li><a href="https://www.megabox.co.kr/benefit/membership"
			class="gnb-txt-benefit" title="혜택">혜택</a>
			<div class="gnb-depth2">
				<ul>
					<li><a href="https://www.megabox.co.kr/benefit/membership"
						title="메가박스 멤버십">메가박스 멤버십</a></li>
					<li><a href="https://www.megabox.co.kr/benefit/discount/guide"
						title="제휴/할인">제휴/할인</a></li>
				</ul>
			</div></li>
	</ul>
	</nav> <!--// gnb --> <script type="text/javascript">
        $(document).ready(function() {
            var filmCheck = MegaboxUtil.Common.moveMovieFilmCheckGnb(); // 영화제 존재여부 체크
            if(filmCheck == true){
                $("#festivalArea").show();
            }else{
                $("#festivalArea").hide();
            }
        });
    </script>


	<div id="layer_sitemap" class="header-layer layer-sitemap">
		wrap
		<div class="wrap">
			<a href="https://www.megabox.co.kr/support/notice" class="link-acc"
				title="사이트맵 레이어 입니다.">사이트맵 레이어 입니다.</a>

			<p class="tit">SITEMAP</p>

			<div class="list position-1">
				<p class="tit-depth">영화</p>

				<ul class="list-depth">
					<li><a href="https://www.megabox.co.kr/movie" title="전체영화">전체영화</a></li>
					<li><a
						href="https://www.megabox.co.kr/curation/specialcontent"
						title="큐레이션">큐레이션</a></li>
					<li><a href="javascript:void(0)"
						onclick="javascript:MegaboxUtil.Common.moveMovieFilmCheck();"
						title="영화제">영화제</a></li>
					<li><a href="https://www.megabox.co.kr/moviepost/all"
						title="무비포스트">무비포스트</a></li>
				</ul>
			</div>

			<div class="list position-2">
				<p class="tit-depth">예매</p>

				<ul class="list-depth">
					<li><a href="https://www.megabox.co.kr/booking" title="빠른예매">빠른예매</a></li>
					<li><a href="https://www.megabox.co.kr/booking/timetable"
						title="상영시간표">상영시간표</a></li>
					<li><a href="https://www.megabox.co.kr/booking/privatebooking"
						title="더 부티크 프라빗 예매">더 부티크 프라이빗 예매</a></li>
					<li><a href="/booking?megaboxLanguage=en"
						title="English Ticketing">English Ticketing</a></li>
				</ul>
			</div>

			<div class="list position-3">
				<p class="tit-depth">극장</p>

				<ul class="list-depth">
					<li><a href="https://www.megabox.co.kr/theater/list"
						title="전체극장">전체극장</a></li>
					<li><a href="https://www.megabox.co.kr/specialtheater/list"
						title="특별관">특별관</a></li>
				</ul>
			</div>

			<div class="list position-4">
				<p class="tit-depth">이벤트</p>

				<ul class="list-depth">
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag(&#39;EVENT_LIST&#39;,&#39;/event&#39;);return false;"
						title="진행중 이벤트">진행중 이벤트</a></li>
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag(&#39;EVENT_LIST&#39;,&#39;/event/end&#39;);return false;"
						title="지난 이벤트">지난 이벤트</a></li>
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag(&#39;EVENT_LIST&#39;,&#39;/event/winner/list&#39;);return false;"
						title="당첨자발표">당첨자발표</a></li>
				</ul>
			</div>

			<div class="list position-5">
				<p class="tit-depth">스토어</p>

				<ul class="list-depth">
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag(&#39;STORE_LIST&#39;,&#39;/store&#39;);return false;"
						title="새로운 상품">새로운 상품</a></li>
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag(&#39;STORE_LIST&#39;,&#39;/store/megaticket&#39;);return false;"
						title="메가티켓">메가티켓</a></li>
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag(&#39;STORE_LIST&#39;,&#39;/store/megachance&#39;);return false;"
						title="메가찬스">메가찬스</a></li>
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag(&#39;STORE_LIST&#39;,&#39;/store/popcorn&#39;);return false;"
						title="팝콘/음료/굿즈">팝콘/음료/굿즈</a></li>
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag('STORE_LIST','/store/e-giftcard');return false;"
						title="기프트카드">기프트카드</a></li>
				</ul>
			</div>
			<div class="list position-6">
				<p class="tit-depth">나의 메가박스</p>
				<ul class="list-depth mymage">


					<li><a
						href="javascript:movePage(&#39;/mypage&#39;,						&#39;로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?&#39;);"
						title="나의 메가박스 홈">나의 메가박스 홈</a></li>
					<li><a
						href="javascript:movePage(&#39;/mypage/bookinglist&#39;,			&#39;로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?&#39;);"
						title="예매/구매내역">예매/구매내역</a></li>
					<li><a
						href="javascript:movePage(&#39;/mypage/movie-coupon&#39;,		&#39;로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?&#39;);"
						title="영화관람권">영화관람권</a></li>
					<li><a
						href="javascript:movePage(&#39;/mypage/store-coupon&#39;,		&#39;로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?&#39;);"
						title="스토어교환권">스토어교환권</a></li>
					<li><a
						href="javascript:movePage(&#39;/mypage/discount-coupon&#39;,		&#39;로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?&#39;);"
						title="할인/제휴쿠폰">할인/제휴쿠폰</a></li>

					<li><a
						href="javascript:movePage(&#39;/mypage/point-list&#39;,			&#39;로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?&#39;);"
						title="멤버십포인트">멤버십포인트</a></li>
					<li><a
						href="javascript:movePage(&#39;/mypage/moviestory&#39;,			&#39;로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?&#39;);"
						title="나의 무비스토리">나의 무비스토리</a></li>
					<li><a
						href="javascript:movePage(&#39;/mypage/myevent&#39;,				&#39;로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?&#39;);"
						title="나의 이벤트 응모내역">나의 이벤트 응모내역</a></li>
					<li><a
						href="javascript:movePage(&#39;/mypage/myinquiry&#39;,			&#39;로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?&#39;);"
						title="나의 문의내역">나의 문의내역</a></li>
					<li><a href="https://www.megabox.co.kr/support/notice#"
						title="자주쓰는 할인 카드">자주쓰는 할인 카드</a></li>
					<li><a
						href="javascript:movePage(&#39;/on/oh/ohh/Mypage/mainPage.do?returnURL=info&#39;,&#39;로그인이 필요한 서비스 입니다.&#39;);"
						title="회원정보">회원정보</a></li>



				</ul>
			</div>

			<div class="list position-7">
				<p class="tit-depth">혜택</p>

				<ul class="list-depth">
					<li><a href="https://www.megabox.co.kr/benefit/membership"
						title="멤버십 안내">멤버십 안내</a></li>
					<li><a href="https://www.megabox.co.kr/benefit/viplounge"
						title="VIP LOUNGE">VIP LOUNGE</a></li>
					<li><a href="https://www.megabox.co.kr/benefit/discount/guide"
						title="제휴/할인">제휴/할인</a></li>
				</ul>
			</div>

			<div class="list position-8">
				<p class="tit-depth">고객센터</p>

				<ul class="list-depth">
					<li><a href="http://localhost/movie/article2" title="고객센터 홈">고객센터
							홈</a></li>
					
					<li><a href="http://localhost/movie/list"
						title="공지사항">공지사항</a></li>
					<li><a href="http://localhost/movie/created"
						title="1:1문의">1:1문의</a></li>
				
				</ul>
			</div>

			<div class="list position-9">
				<p class="tit-depth">회사소개</p>

				<ul class="list-depth">
					<li><a href="https://www.megabox.co.kr/megaboxinfo"
						target="_blank" title="메가박스소개">메가박스소개</a></li>
					<li><a href="https://www.megabox.co.kr/socialcontribution"
						target="_blank" title="사회공헌">사회공헌</a></li>
					<li><a href="https://www.megabox.co.kr/advertize"
						target="_blank" title="홍보자료">홍보자료</a></li>
					<li><a href="https://www.megabox.co.kr/partner"
						target="_blank" title="제휴/부대사업문의">제휴/부대사업문의</a></li>
					<li><a href="https://www.megabox.co.kr/onlinereport"
						target="_blank" title="온라인제보센터">온라인제보센터</a></li>
					<li><a href="https://www.megabox.co.kr/ir" target="_blank"
						title="자료">IR자료</a></li>
					<li><a href="https://www.megabox.co.kr/recruit"
						target="_blank" title="인재채용림">인재채용</a></li>
					<li><a href="https://jebo.joonganggroup.com/main.do"
						target="_blank" title="윤리경영">윤리경영</a></li>
				</ul>
			</div>

			<div class="list position-10">
				<p class="tit-depth">이용정책</p>

				<ul class="list-depth">
					<li><a href="https://www.megabox.co.kr/support/terms"
						title="이용약관">이용약관</a></li>
					<li><a href="https://www.megabox.co.kr/support/lcinfo"
						title="위치기반서비스 이용약관">위치기반서비스 이용약관</a></li>
					<li><a href="https://www.megabox.co.kr/support/privacy"
						title="개인정보처리방침">개인정보처리방침</a></li>
					<li><a href="https://www.megabox.co.kr/support/screenrule"
						title="스크린수배정에관한기준">스크린수배정에관한기준</a></li>
				</ul>
			</div>

			<div class="ir">
				<a href="https://www.megabox.co.kr/support/notice"
					class="layer-close" title="레이어닫기">레이어닫기</a>
			</div>
		</div>
		// wrap
	</div>
	<!--// 레이어 : 사이트맵 --> <!-- 레이어 : 검색 -->
	<div id="layer_header_search" class="header-layer layer-header-search"></div>
	<!--// 레이어 : 검색 --> <!-- 레이어 : 마이페이지 --> </header>

	<!-- ------------------------------------------------------------------- -->
	<!--// header -->
	<form id="bokdMForm">
		<input type="hidden" name="returnURL" value="info">
	</form>

	<div class="container" style="padding-bottom: 240px;">
		<div class="page-util" style="">
			<div class="inner-wrap">
				<div class="location">
					<span>Home</span> <a href="http://localhost/movie/article2"
						title="고객센터">고객센터</a> <a
						href="http://localhost/movie/article2" title="고객센터">고객센터
						${mtnDto.movie }</a>
				</div>
			</div>
		</div>




		<!-- ------------------------------------------------------------------- -->

		<!-- container -->
		<div class="container has-lnb">
			<div class="page-util fixed">
				<div class="inner-wrap">
					<div class="location">
						<span>Home</span> <a href="http://localhost/movie/article2"
							title="고객센터 페이지로 이동">고객센터</a> <a
							href="https://www.megabox.co.kr/support/notice"
							title="공지사항 페이지로 이동">공지사항</a>
					</div>

				</div>
			</div>

			<div class="inner-wrap">
				<div class="lnb-area addchat location-fixed">
					<nav id="lnb">
					<p class="tit">
						<a href="http://localhost:8080/movie/article2" title="고객센터">고객센터</a>
					</p>
					<ul>
						<li class="on"><a href="http://localhost/movie/article2" title="고객센터 홈">고객센터
								홈</a></li>
						<li><a href="http://localhost:8080/movie/list"
							title="공지사항">공지사항</a></li>
						<li><a href="http://localhost:8080/movie/created" title="1:1문의">1:1문의</a></li>
						<li><a href="http://localhost:8080/boardlist" title="게시판">게시판</a></li>
					</ul>

					<!-- 고객센터 메뉴일때만 출력 -->
					<div class="left-customer-info">
						<p class="tit">
							메가박스 고객센터 <span>Dream center</span>
						</p>
						<p class="time">
							<i class="iconset ico-clock"></i> 10:00~19:00
						</p>
					</div>
					</nav>
				</div>




				<!-- ------------------------------------------------------------------------------------- -------------->





				<div id="contents" class="location-fixed">
					<h2 class="tit">고객센터</h2>

					<!-- input-search-area -->
				<div class="input-search-area mb30">
					<div class="input-area">
						<label for="search01" class="label">빠른검색</label>

						<div class="board-search w460px">
							<input type="search" id="searchTxt" title="검색어를 입력해 주세요." placeholder="검색어를 입력해 주세요." class="input-text" maxlength="15">
							<button type="button" class="btn-search-input" id="searchBtn">검색</button>
						</div>
					</div>

					<div class="btn-area">
						
					</div>
				</div>
				<!--// input-search-area -->


					<div class="custo-main">
					<div class="main-block">
						<div class="block-content" style="display: none">
							<a href="#" id="channelTalk" title="상담톡 이용">
								<p>
									<strong>상담톡 이용</strong>
									상담톡으로 편리하게 문의해주세요.
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="/support/lost" title="분실물 문의 페이지로 이동">
								<p>
									<strong>분실물 문의</strong>
									잃어버린 물건을 접수해 주시면<br / >신속히 찾아드리겠습니다.
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="/support/inquiry" title="1:1 문의 페이지로 이동">
								<p>
									<strong>1:1 문의</strong>
									해결되지않은 문제가 있나요?<br />1:1문의로 문의주세요
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="/support/rent" title="단체관람 및 대관문의 페이지로 이동">
								<p>
									<strong>단체관람 및 대관문의</strong>
									단체관람 또는 대관을 원하시면<br />문의 해주세요.
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="/benefit/discount/guide" title="할인카드 안내 페이지로 이동">
								<p>
									<strong>할인카드 안내</strong>
									멤버십 제휴카드 및 다양한 할인카드를<br />통해 알뜰하게 영화 감상하세요.
								</p>
							</a>
						</div>
						<div class="block-content">
							<a href="/support/faq" title="자주 묻는 질문 페이지로 이동">
								<p>
									<strong>자주 묻는 질문</strong>
									자주 묻는 질문<br/>빠르고 간편하게 검색하세요.
								</p>
							</a>
						</div>
					</div>

					<div class="notice-wrap">
						<div class="block left">
							<div class="tit-area">
								<h3 class="tit small">자주 묻는 질문 BEST5</h3>

								<a href="/support/faq" class="more" title="더보기">더보기 <i class="iconset ico-arr-right-gray ml07"></i></a>
							</div>
							<div class="">
								<ol class="decimal-list">
									
										<li>
											<a href="#" class="faqBtn" data-idx="1" title="질문 상세보기">
												<span class="font-roboto">1</span>&nbsp;
												<span class="font-gblue">[영화예매]</span> 인터넷 예매시 부분환불/교환이 가능한가요?
												<span class="date">2020.01.16</span>
											</a>
										</li>
									
										<li>
											<a href="#" class="faqBtn" data-idx="2" title="질문 상세보기">
												<span class="font-roboto">2</span>&nbsp;
												<span class="font-gblue">[극장]</span> ARS 이용안내
												<span class="date">2023.01.04</span>
											</a>
										</li>
									
										<li>
											<a href="#" class="faqBtn" data-idx="3" title="질문 상세보기">
												<span class="font-roboto">3</span>&nbsp;
												<span class="font-gblue">[홈페이지/모바일]</span> 이름을 개명했는데 어디서 바꾸나요?
												<span class="date">2020.03.12</span>
											</a>
										</li>
									
										<li>
											<a href="#" class="faqBtn" data-idx="4" title="질문 상세보기">
												<span class="font-roboto">4</span>&nbsp;
												<span class="font-gblue">[영화예매]</span> 국가유공자 혜택은 어떻게 되나요?
												<span class="date">2022.05.30</span>
											</a>
										</li>
									
										<li>
											<a href="#" class="faqBtn" data-idx="5" title="질문 상세보기">
												<span class="font-roboto">5</span>&nbsp;
												<span class="font-gblue">[결제수단/관람권]</span> 멤버십에 등록한 영화관람권 삭제는 어떻게 하나요?
												<span class="date">2022.01.04</span>
											</a>
										</li>
									
								</ol>
							</div>
						</div>

						<div class="block right">
							<div class="tit-area">
								<h3 class="tit small">공지사항</h3>

								<a href="/support/notice" class="more" title="더보기">더보기 <i class="iconset ico-arr-right-gray ml07"></i></a>
							</div>

							<div class="decimal-list">
								<ol>
									
										<li>
											<a href="#" class="moveBtn" data-no="10774" title="공지사항 상세보기">
												
													
													
														<span class="font-purple"><i class="iconset ico-marker"></i> [창원]</span>
													
												
												[창원]임시 휴점 안내
												<span class="date">2023.02.06</span>
											</a>
										</li>
									
										<li>
											<a href="#" class="moveBtn" data-no="10773" title="공지사항 상세보기">
												
													
														<span class="font-gblue"><i class="iconset ico-notice"></i> [공지]</span>
													
													
												
												[GS&amp;POINT] 시스템 정기 점검 안내 &#40;2/9&#41;
												<span class="date">2023.02.06</span>
											</a>
										</li>
									
										<li>
											<a href="#" class="moveBtn" data-no="10772" title="공지사항 상세보기">
												
													
														<span class="font-gblue"><i class="iconset ico-notice"></i> [공지]</span>
													
													
												
												[해피머니] 이용 서비스 제한 안내&#40;2/5&#41;
												<span class="date">2023.02.03</span>
											</a>
										</li>
									
										<li>
											<a href="#" class="moveBtn" data-no="10771" title="공지사항 상세보기">
												
													
														<span class="font-gblue"><i class="iconset ico-notice"></i> [공지]</span>
													
													
												
												[삼성카드] 승인시스템 서비스 제한 안내&#40;2/19&#41;
												<span class="date">2023.02.03</span>
											</a>
										</li>
									
										<li>
											<a href="#" class="moveBtn" data-no="10768" title="공지사항 상세보기">
												
													
													
														<span class="font-purple"><i class="iconset ico-marker"></i> [코엑스]</span>
													
												
												[코엑스] 코엑스몰 전시회 진행에 따른 주차안내문&#40;2/1~2/3&#41;
												<span class="date">2023.02.02</span>
											</a>
										</li>
									
								</ol>
							</div>
						</div>
					
					</div>
					</div>
					</div>
					</div></div>
					</div>
					
					<!-- footer -->
	<jsp:include page="../layout/footerGrey.jsp"></jsp:include>
    <!-- //footer -->
   
					
</body>

</html>





























