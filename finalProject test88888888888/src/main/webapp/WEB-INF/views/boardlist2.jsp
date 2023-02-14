<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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




<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>

<script src="<c:url value='/js/app.js' />"></script>

<script src="<c:url value='/js/boardlist_service.js' />"></script>

<script src="<c:url value='/js/boardlist_controller.js' />"></script>
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
<body ng-app="myBoard" class="ng-cloak"
	ng-controller="BoardlistController as ctrl">

	<!-- header -->
	<header id="header">
	<h1 class="ci">
		<a href="http://localhost:80/main" title="MEGABOX 메인으로 가기">MEGABOX
			: Life Theater</a>
	</h1>




	<!-- 2019-04-15 마크업 수정 : 고객요청  -->
	<div class="util-area">
		<div class="left-link">
			<a href="https://www.megabox.co.kr/benefit/viplounge"
				title="VIP LOUNGE">VIP LOUNGE</a> <a
				href="https://www.megabox.co.kr/benefit/membership" title="멤버십">멤버십</a>
			<a href="https://www.megabox.co.kr/support" title="고객센터">고객센터</a>
		</div>

		<div class="right-link">
			<!-- 로그인전 -->
			<div class="before" style="">
				<a
					href="javaScript:fn_viewLoginPopup(&#39;default&#39;,&#39;pc&#39;)"
					title="로그인">로그인</a> <a href="https://www.megabox.co.kr/join"
					title="회원가입">회원가입</a>
			</div>

			<!-- 로그인후 -->
			<div class="after" style="display: none">
				<a href="https://www.megabox.co.kr/on/oh/ohg/MbLogin/mbLogout.do"
					class="" title="로그아웃">로그아웃</a> <a
					href="https://www.megabox.co.kr/support/notice" class="notice"
					title="알림">알림</a>

				<!-- layer-header-notice -->
				<div class="layer-header-notice">
					<div class="notice-wrap">
						<p class="tit-notice">알림함</p>

						<div class="count">
							<p class="left">
								전체 <em class="totalCnt">0</em> 건
							</p>

							<p class="right">* 최근 30일 내역만 노출됩니다.</p>
						</div>

						<!-- scroll -->
						<div
							class="scroll m-scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar">
							<div id="mCSB_1"
								class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
								style="max-height: none;" tabindex="0">
								<div id="mCSB_1_container"
									class="mCSB_container mCS_no_scrollbar_y"
									style="position: relative; top: 0; left: 0;" dir="ltr">
									<ul class="list">
										<li class="no-list">알림 내역이 없습니다.</li>
									</ul>
								</div>
								<div id="mCSB_1_scrollbar_vertical"
									class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical">
									<div class="mCSB_draggerContainer">
										<div id="mCSB_1_dragger_vertical" class="mCSB_dragger"
											style="position: absolute; min-height: 30px; display: none; top: 0px;">
											<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
										</div>
										<div class="mCSB_draggerRail"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="notice-list-more">
							<button type="button" class="button btn-more-notice-list">
								더보기 <i class="iconset ico-btn-more-arr"></i>
							</button>
						</div>
						<!--// scroll -->
						<button type="button" class="btn-close-header-notice">알림
							닫기</button>
					</div>
					<!--// notice-wrap -->
					<!--// layer-header-notice -->
				</div>

			</div>

			<a href="https://www.megabox.co.kr/booking">빠른예매</a>
		</div>
	</div>
	<!--// 2019-04-15 마크업 수정 : 고객요청  -->

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

	<!-- gnb --> <!--
        2019-04-15 마크업 수정 : 고객요청
        1뎁스 a 태그에 각각 다른 class 추가
    --> <nav id="gnb">
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
		<li><a href="https://www.megabox.co.kr/booking"
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
    </script> <!--// topGnb --> <!-- 레이어 : 사이트맵 -->




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
					<li><a href="https://www.megabox.co.kr/support" title="고객센터 홈">고객센터
							홈</a></li>
					<li><a href="https://www.megabox.co.kr/support/faq"
						title="자주묻는질문">자주묻는질문</a></li>
					<li><a href="https://www.megabox.co.kr/support/notice"
						title="공지사항">공지사항</a></li>
					<li><a href="https://www.megabox.co.kr/support/inquiry"
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
	<!--// 레이어 : 검색 --> <!-- 레이어 : 마이페이지 -->




	<div id="layer_mymega" class="header-layer layer-mymege">
		<a href="https://www.megabox.co.kr/support/notice" class="ir"
			title="나의 메가박스 레이어 입니다.">나의 메가박스 레이어 입니다.</a>

		<!-- wrap -->
		<div class="wrap" style="display: none">

			<div class="login-after">
				<div class="couponpass" style="display: none;">
					<span>쿠폰패스 이용고객이시군요!!쿠폰패스로 발급된 쿠폰을 확인해보세요~ </span>
				</div>
				<div class="user-info">
					<p class="txt">안녕하세요!</p>

					<p class="info">

						vip 일때만 출력 vip 아닐때는 태그 자체 삭제 <em class="vip">VIP PREMIUM</em> <em
							class="name"></em> <span>회원님</span>
					</p>

					<div class="last-date">
						마지막 접속일 : <em></em>
					</div>

					<!-- vip, 멤버십 없을때는 미 출력  -->
					<div class="membership">
						<i class="iconset ico-header-vip"></i> <i
							class="iconset ico-header-film"></i> <i
							class="iconset ico-header-classic"></i>
					</div>

					<div class="btn-fixed">
						<a href="https://www.megabox.co.kr/mypage" class="button"
							title="나의  메가박스">나의 메가박스</a>
					</div>
				</div>

				<div class="box">
					<div class="point">
						<p class="tit">Point</p>

						<p class="count">0</p>

						<div class="btn-fixed">
							<a href="https://www.megabox.co.kr/mypage/point-list"
								class="button" title="멤버십 포인트">멤버십 포인트</a>
						</div>
					</div>
				</div>

				<div class="box">
					<div class="coupon">
						<p class="tit">
							쿠폰/관람권
							<!-- <i class="iconset ico-header-new"></i> -->
						</p>

						<p class="count">
							<em title="쿠폰 수" class="cpon">0</em> <span title="관람권 수"
								class="movie">0</span>
						</p>

						<div class="btn-fixed">
							<a href="https://www.megabox.co.kr/mypage/discount-coupon"
								class="button" title="쿠폰">쿠폰</a> <a
								href="https://www.megabox.co.kr/mypage/movie-coupon"
								class="button" title="관람권">관람권</a>
						</div>
					</div>
				</div>

				<div class="box">
					<div class="reserve">
						<p class="tit">
							예매
							<!-- <i class="iconset ico-header-new"></i> -->
						</p>

						<p class="txt"></p>

						<div class="btn-fixed">
							<a href="https://www.megabox.co.kr/mypage/bookinglist"
								class="button" title="예매내역">예매내역 </a>
						</div>
					</div>
				</div>

				<div class="box">
					<div class="buy">
						<p class="tit">
							구매
							<!-- <i class="iconset ico-header-new"></i> -->
						</p>

						<p class="count">
							<em>0</em> <span>건</span>
						</p>
					</div>

					<div class="btn-fixed">
						<a href="https://www.megabox.co.kr/mypage/bookinglist?tab=02"
							class="button" title="구매내역">구매내역</a>
					</div>
				</div>
			</div>

			<!-- 로그인 전 -->
			<div class="login-before">
				<p class="txt">
					로그인 하시면 나의 메가박스를 만날 수 있어요.<br> 영화를 사랑하는 당신을 위한 꼭 맞는 혜택까지 확인해
					보세요!
				</p>

				<div class="mb50">
					<a
						href="https://www.megabox.co.kr/support/notice#layer_login_common"
						id="moveLogin" title="로그인" class="button w120px btn-modal-open"
						w-data="850" h-data="484">로그인</a>
				</div>

				<a href="https://www.megabox.co.kr/join" class="link"
					title="혹시 아직 회원이 아니신가요?">혹시 아직 회원이 아니신가요?</a>
			</div>
		</div>
		<!--// wrap -->

		<div class="ir">
			<a href="https://www.megabox.co.kr/support/notice"
				class="layer-close" title="레이어닫기">레이어닫기</a>
		</div>
	</div>
	<!--// 레이어 : 마이페이지 --> </header>
	<!--// header -->

	<div class="page-util" style="">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span> <a href="http://localhost/movie/article"
					title="고객센터">고객센터</a> <a href="http://localhost/movie/created"
					title="게시판">게시판 ${mtnDto.movie }</a>
			</div>
		</div>
	</div>




	<!-- container -->
	<div class="container has-lnb">


		<div class="inner-wrap">
			<div class="lnb-area addchat location-fixed">
				<nav id="lnb">
				<p class="tit">
					<a href="http://localhost/movie/article" title="고객센터">고객센터</a>
				</p>
				<ul>
					<li><a href="http://localhost/movie/article" title="고객센터 홈">고객센터
							홈</a></li>
					<li><a href="http://localhost/movie/list" title="공지사항">공지사항</a></li>
					<li><a href="http://localhost:80/movie/created2" title="1:1문의">1:1문의</a></li>
					<li class="on"><a href="http://localhost:80/boardlist"
						title="게시판">게시판</a></li>
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

			<div id="contents" class="location-fixed">
				<h2 class="tit">게시글 작성</h2>

				<div id="bbs">
					<div ng-controller="BoardlistController as ctrl">
						<!-- 	<form action="" method="post" name="myForm"> -->
						<form ng-submit="ctrl.submit()" name="myForm"
							class="form-horizontal">

							<input type="hidden" ng-model="ctrl.boardlist.id" />

							<div id="bbsCreated">
								<table class="board-form va-m">
									<colgroup>
										<col style="width: 150px;">
										<col>
										<col style="width: 150px;">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">게시판<em class="font-orange">*</em></th>
											<td colspan="3"><input type="radio" id="aq1"
												name="inqMclCd" value="QD01M01" data-cd="QD_BRCH_DIV_CD"
												checked=""> <label for="aq1">자유게시판</label> <input
												type="radio" id="aq2" name="inqMclCd" class="ml20"
												value="QD01M02" data-cd="QD_ETC_DIV_CD"> <label
												for="aq2">후기게시판</label></td>
										</tr>



										<tr>
											<th scope="row"><label for="title">제목</label> <em
												class="font-orange">*</em></th>
											<td><input type="text" id="title"
												ng-model="ctrl.boardlist.title"
												class="input-text, title form-control input-sm" value=""
												maxlength="50" placeholder="Enter your Title" required>

												<div class="has-error" ng-show="myForm.$dirty"></div></td>

										</tr>
										
											


										<tr>

											<th scope="row"><label for="name">글쓴이</label> <em
												class="font-orange">*</em></th>
											<td><input type="text" id="name"
												ng-model="ctrl.boardlist.name"
												class="input-text w650px, name form-control input-sm"
												value="" maxlength="15" placeholder="Enter your Name"
												required ng-maxlength="20">
												<div class="has-error" ng-show="myForm.$dirty"></div></td>


											<th scope="row"><label for="passwd">패스워드</label> <em
												class="font-orange">*</em></th>
											<td><input type="password" id="passwd"
												ng-model="ctrl.boardlist.passwd"
												class="input-text w650px,  passwd form-control input-sm"
												value="" maxlength="15" placeholder="Enter your Password"
												required ng-maxlength="20">
												<div class="has-error" ng-show="myForm.$dirty"></div></td>
										</tr>



										<tr>
											<th scope="row"><label for="conten">내용</label> <em
												class="font-orange , col-md-2 control-lable">*</em></th>
											<td colspan="3">
												<div class="textarea">
													<textarea name="content" rows="5" cols="30" title="내용입력"
														ng-model="ctrl.boardlist.content" id="content"
														placeholder="※내용 게시"
														class="input-textarea , content form-control input-sm"
														required style="height: 320px;"></textarea>
													<div class="has-error" ng-show="myForm.$dirty"></div>
													<div class="util">
														<p class="count">
															<span id="textareaCnt">0</span> / 2000
														</p>
													</div>
												</div>
											</td>
										</tr>

										<!-- 2019-02-14 사진첨부 마크업 수정 -->
										
										
										<tr align="left">



								<th align="center">글번호</th>

								<th align="center">제목</th>

								<th align="center">글쓴이</th>

								<th align="center">등록일</th>

								<th align="center">조회수</th>






								<th align="center">조회/삭제</th>




							</tr>
										<tr data-ng-repeat="boardlist in ctrl.page.content">

									<td align="center"><span ng-bind="{{$index+1}}"></span></td>

									
									<td align="left">
										<!-- 레벨의 수만큼 글을 뒤로 민다 --> <span
										ng-repeat="n in [].constructor(boardlist.replylevel) track by $index">

											&nbsp;&nbsp; </span> <span ng-bind="boardlist.title"></span>

									</td>
									
									
									
									<td align="center"><span ng-bind="boardlist.id"></span></td>


									

									<td align="center">{{boardlist.regdate | date:"yy.MM.dd
										hh:mm"}}</td>

									<td align="center"><span ng-bind="boardlist.readcount"></span></td>

									<td>

										<button type="button" ng-click="ctrl.edit(boardlist.id)"
											class="btn btn-success custom-width">게시글 조회</button>

										<button type="button" ng-click="ctrl.delete(boardlist.id)"
											class="btn btn-danger custom-width">삭제하기</button>

									</td>

								</tr>
										<!--// 2019-02-14 사진첨부 마크업 수정 -->



									
								</table>

							</div>


							


							<br /> <br />
							<div id="bbsCreated_footer" align="center" class="form-actions floatRight">
								<input type="submit" value=" {{!ctrl.boardlist.id ? '등록하기' : 'Update'}}"  class="button purple large"
									onclick="sendIt();" ng-disabled="myForm.$invalid" />
									
									
									
									
									
									 <input type="reset" value=" 다시입력 "
									class="button purple large"
									onclick="document.myForm.subject.focus();" /> 
									
									
								
									
									<input
									type="button" value=" 돌아가기 " class="button purple large"
									onclick="javascript:location.href='<%=cp%>/movie/list';" />
									
									
									
								
											
											
								
									
									
									
							</div>
</tbody>
						</form>



					</div>


					<div class="quick-area" style="display: none;">
						<a href="https://www.megabox.co.kr/support/inquiry"
							class="btn-go-top" title="top" style="position: fixed;">top</a>
					</div>
				</div>























</body>
</html>





























