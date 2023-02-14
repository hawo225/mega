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



<script type="text/javascript">

	function sendIt(){
		
		var f = document.searchForm;
		f.action = "<%=cp%>
	/movie/list";
		f.submit();
	}
</script>





</head>
<body>


	<!-- header -->
	<jsp:include page="../layout/headerWhite.jsp"></jsp:include>
	<!--// header -->


	<!-- 헤더 부분 바로 가기 아이콘  -->
	<div class="page-util" style="">
		<div class="inner-wrap">
			<div class="location">
				<span>Home</span> <a href="http://localhost/movie/article"
					title="고객센터">고객센터</a> <a href="http://localhost/movie/list"
					title="공지사항">공지사항 ${mtnDto.movie }</a>
			</div>
		</div>
	</div>





	<!-- container -->
	<div class="container has-lnb">


		<div class="inner-wrap">


			<!-- 네비바 -->
			<div class="lnb-area addchat location-fixed">
				<nav id="lnb">
				<p class="tit">
					<a href="https://www.megabox.co.kr/support" title="고객센터">고객센터</a>
				</p>
				<ul>
					<li><a href="http://localhost:80/movie/article" title="고객센터 홈">고객센터
							홈</a></li>

					<li class="on"><a href="http://localhost:80/movie/list"
						title="공지사항">공지사항</a></li>
					<li><a href="http://localhost:80/movie/created" title="1:1문의">1:1문의</a></li>
					<li><a href="http://localhost:80/boardlist" title="게시판">게시판</a></li>

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


			<!--  클래스 타입을 location-fixed 로 설정하면 변경 가능하다 -->
			<div id="contents" class="location-fixed">
				<h2 class="tit">공지사항</h2>

				<div class="tab-block mb30">
					<ul>
					<!-- on tabBtn으로 설정하면 가장 먼저 보이는 버튼 속성 -->
						<li class="on tabBtn"><button type="button"
								class="btn tabBtn" data-no="" title="전체공지 보기">전체</button></li>
                         <!-- 이후 버튼 순서대로 출력 -->
						<li class="tabBtn"><button type="button" class="btn"
								data-no="81" title="메가박스 공지 보기">메가박스 공지</button></li>

						<li class="tabBtn"><button type="button" class="btn"
								data-no="82" title="지점 공지 보기">지점 공지</button></li>

					</ul>
				</div>

                  <!-- 검색창 -->
				<div id="bbsList">
                      <!--  검색창 안의 속성을 선택 할 수 있다. -->
					<div id="bbsList_header">
					<!-- 가장 왼쪽 시작 헤더 -->
						<div id="leftHeader">
							<form action="" method="post" name="searchForm">
							
								<select name="searchKey" class="selectField">
									<option value="subject">제목</option>
									<option value="name">작성자</option>
									<option value="content">내용</option>
									
									<!-- 검색 내용에 알맞는 텍스트 타입의 파일들을 검색할 수 있다 -->
								</select> <input type="text" name="searchValue" class="textField" /> <input
									type="button" value=" 검 색 " class="btn2" onclick="sendIt()" />
							</form>
						</div>
						<div id="rightHeader"></div>
					</div>
					<div id="bbsList_list">
						<div id="title">
						<!-- 각각의 클래스를 설정 -->
							<dl>
								<dt class="num">번호</dt>
								<dt class="subject">제목</dt>
								<dt class="name">작성자</dt>
								<dt class="created">작성일</dt>
								<dt class="hitCount">조회수</dt>
							</dl>
						</div>
						
						<div id="lists">
							<c:forEach var="dto" items="${lists }">
								<%-- BoardDTO : lists와 동일 EL로 받은것  --%>
								<dl>
									<%-- EL로 받은것은 변수명을 게터로받지않고 그대로 사용 그렇다고 DAO의 게터세터를 지우면안됌. --%>
									<dd class="num">${dto.num }</dd>
									<dd class="subject">
										<a href="${articleUrl }&num=${dto.num }"> ${dto.subject }</a>
									</dd>
									<dd class="name">${dto.name }</dd>
									<dd class="created">${dto.created }</dd>
									<dd class="hitCount">${dto.hitCount }</dd>
								</dl>
							</c:forEach>
						</div>
						<div nav class="pagination" id="footer">
							<c:if test="${dataCount!=0 }">
				${pageIndexList }
			</c:if>
							<c:if test="${dataCount==0 }">
				등록된 게시물이 없습니다.
			</c:if>

						</div>

					</div>




				</div>
			</div>
		</div>
		<!--// container -->

		<!-- footer -->
		<jsp:include page="../layout/footerGrey.jsp"></jsp:include>
		<!-- //footer -->
</body>
</html>







