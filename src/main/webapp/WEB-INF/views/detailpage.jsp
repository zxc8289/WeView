<%@page import="weview.dto.DetailDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
DetailDto dto = (DetailDto) request.getAttribute("detail");

String ageLimit = null;
if (dto.getAge() == 20) {
	ageLimit = "청소년 관람 불가";
} else {
	ageLimit = dto.getAge() + "세 관람가";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weview - 영화 정보</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


<script>
        function show(){
            document.getElementById("hiddnviews").style.display ='block';
        }

        function hide(){
            document.getElementById("hiddnviews").style.display ='none';
        }
        function show1(){
            document.getElementById("showmoviestory").style.display ='block';
        }

        function hide1(){
            document.getElementById("showmoviestory").style.display ='none';
        }
        
        
    </script>
    
<link href="resources/css/styles.css" rel="stylesheet" />    
</head>
<body>

	<div id="hiddnviews">
		<div id="showHide"></div>
		<div id="showTRALER">
			<div id="showTRALER_1" class="TRALERcolor">
				<iframe id="TRALER" width="100%" height="100%"
					src="<%=dto.getTrailer()%>" frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope;  picture-in-picture"
					allowfullscreen></iframe>

			</div>
		</div>
		<div class="buttondiv">
			<button id="showbutton" onclick=hide();>X</button>
		</div>
	</div>
	<div id="showmoviestory">
		<div id="showHide"></div>
		<div id="showTRALER">
			<div id="showTRALER_1" class="storycolor">
				<span id="story"> <%=dto.getStory()%>
				</span>
			</div>
		</div>
		<div class="buttondiv">
			<button id="hiddnmoviestory" onclick=hide1();>X</button>
		</div>
	</div>
	<!-- Navigation-->

	<jsp:include page="includes/navigation.jsp" />

	<!-- Section-->
	<section class="py-5" style="display: flex;">
		<div class="container1 movie_ex">
			<img src="resources/images/<%=dto.getPoster()%>" alt=""
				class="movie_img">
			<div class="information ">
				<div class="score">
					<div class="TITLE sc_1">
						<div class="sc_1_1">
							<span class="sc_1_1_movie_name" id="TITLE"><b><%=dto.getTitle()%></b></span>
						</div>
					</div>
					<div class="RATE sc_2" id="RATE">
						<div class="sc_2_1">
							<span class="sc_2_1_name">평점&nbsp&nbsp&nbsp&nbsp</span>
						</div>
						<div class="sc_2_2_star">
							<%=dto.getRate()%>점
						</div>
						<div class="sc_2_3_age" style="width: auto !important; margin-right: 1em; color: red;">
							<span class="sc_2_3_AGE" id="AGE"><%=ageLimit%></span>
						</div>
					</div>
					<div class="AGEdiv sc_3">
						<button class="찜">
							<div>♡</div>
						</button>
					</div>
				</div>
				<div class="details">
					<dl>
						<dt>
							<span>개요</span>
						</dt>
						<dd class="개요">
							<p>
								<span class="span_1"><%=dto.getGenre()%></span> <span
									class="span_2"><%=dto.getCountry()%></span> <span
									class="span_2"><%=dto.getRunningtime()%>분</span> <span
									class="span_2"><%=dto.getCreated()%> 개봉</span>
							</p>
						</dd>
						<dt class="director">감독</dt>
						<dd>
							<p>
								<span> <%=dto.getDirector()%>
								</span>
							</p>
						</dd>
						<dt class="actor">배우</dt>
						<dd>
							<p>
								<span><%=dto.getActor()%> </span>
							</p>
						</dd>
					</dl>
				</div>
				<div class="picture">
					<div class="pic_1">
						<button type="button" class="btn btn-outline-secondary" id="show"
							onclick=show();>예고편</button>
						<!-- <button type="button" class="btn btn-outline-secondary" >사진</button> -->
						<button type="button" class="btn btn-outline-secondary" id="show1"
							onclick=show1();>줄거리</button>
					</div>
				</div>
			</div>

			<!-- <div class="recommend">
				<img src="캡처.PNG" alt="" class="recommend">
			</div> -->
		</div>
		<%-- <div class="container1 movie_re">
			<div class="m_1">
				<div class="comments">
					<div class="starpoint_wrap">
						<div class="starpoint_box">
							<label for="starpoint_1" class="label_star" title="0.5"><span
								class="blind">0.5점</span></label> <label for="starpoint_2"
								class="label_star" title="1"><span class="blind">1점</span></label>
							<label for="starpoint_3" class="label_star" title="1.5"><span
								class="blind">1.5점</span></label> <label for="starpoint_4"
								class="label_star" title="2"><span class="blind">2점</span></label>
							<label for="starpoint_5" class="label_star" title="2.5"><span
								class="blind">2.5점</span></label> <label for="starpoint_6"
								class="label_star" title="3"><span class="blind">3점</span></label>
							<label for="starpoint_7" class="label_star" title="3.5"><span
								class="blind">3.5점</span></label> <label for="starpoint_8"
								class="label_star" title="4"><span class="blind">4점</span></label>
							<label for="starpoint_9" class="label_star" title="4.5"><span
								class="blind">4.5점</span></label> <label for="starpoint_10"
								class="label_star" title="5"><span class="blind">5점</span></label>
							<input type="radio" name="starpoint" id="starpoint_1"
								class="star_radio"> <input type="radio" name="starpoint"
								id="starpoint_2" class="star_radio"> <input type="radio"
								name="starpoint" id="starpoint_3" class="star_radio"> <input
								type="radio" name="starpoint" id="starpoint_4"
								class="star_radio"> <input type="radio" name="starpoint"
								id="starpoint_5" class="star_radio"> <input type="radio"
								name="starpoint" id="starpoint_6" class="star_radio"> <input
								type="radio" name="starpoint" id="starpoint_7"
								class="star_radio"> <input type="radio" name="starpoint"
								id="starpoint_8" class="star_radio"> <input type="radio"
								name="starpoint" id="starpoint_9" class="star_radio"> <input
								type="radio" name="starpoint" id="starpoint_10"
								class="star_radio"> <span class="starpoint_bg"></span>
						</div>
					</div>
					<!-- 원글에 댓글을 작성할 수 있는 폼 -->
					<div class="comment_form">
						<form action="comment_insert.do" method="post">
							<!-- 댓글의 그룹번호는 원글의 글번호가 된다. -->
							<input type="hidden" name="ref_group" value="${dto.num }" />
							<!-- 댓글의 대상자는 원글의 작성자가 된다. -->
							<input type="hidden" name="target_id" value="${dto.writer }" />
							<textarea rows="content"><c:if test="${empty id }">로그인이 필요합니다.</c:if></textarea>
							<button type="submit">등록</button>
						</form>
					</div>
				</div>
			</div>
		</div> --%>



	</section>
</body>
</html>

