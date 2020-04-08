<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모아보기</title>
<style type="text/css">

h1{
	margin-left: 10%;
}

.wrapper {
	align-content: center;
	align-items: center;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
	width: 1200px;
	margin-left: 10%;
}

.wrapper>div {
	border: 1px solid rgb(248, 112, 97);
	margin: 5px;
	box-sizing: border-box;
	width: 200px;
	height: 180px;
	display: -moz-box;
	display: -ms-flexbox;
	justify-content: center;
	align-items: center;
	border-radius: 10px;
	cursor: pointer;
	/* font-family: Montserrat-Bold; */
	font-size: 15px;
	color: black;
	line-height: 1.1;
	text-transform: uppercase;
	letter-spacing: 1px;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
	float: none;
}

.wrapper>div:hover {
	background-color: gray;
}
/* 나중에 문제 있으면 추가할 것
body {
	background: gray;
	margin: 0;
	padding: 0; */
}

#wrap {
	width: 100%;
	height: 100px;
	background: white;
}

#sidebar {
	background: white;
	width: 300px;
	height: 350px;
	top: 300px;
	left: -300px;
	position: fixed;
	border: 1px solid rgb(248, 112, 97);
	border-radius: 10px;
}

#sidebar div {
	border-radius : 10px;
	margin: 0 0 20px;
	list-style: none;
}
#sidebar div:hover {
	background-color: gray;
	font-size: 15px;
	color: black;
	line-height: 1.1;
	text-transform: uppercase;
	letter-spacing: 1px;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;

}

#sidebar>button {
	background: rgb(248, 112, 97);
	position: absolute;
	top: 250px;
	left: 300px;
	width: 52px;
	height: 52px;
	border: none;
	color: white;
	border-radius: 10px;
}

.sideMenu{
margin-bottom: 10px;}
</style>
</head>
<body>
<!-- header -->
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<!-- 사이드바 JS -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	$(function(){
		var duration = 300;

		var $side = $('#sidebar');
		var $sidebt = $side.find('button').on('click', function(){
			$side.toggleClass('open');

			if($side.hasClass('open')) {
				$side.stop(true).animate({left:'0px'}, duration);
				$sidebt.find('span').text('CLOSE');
			}else{
				$side.stop(true).animate({left:'-300px'}, duration);
				$sidebt.find('span').text('OPEN');
			};
		});
	});
</script>
	
	<!-- 드래그앤드랍 JS -->
	<script type="text/javascript">
	function dragEnter(ev) {
		ev.preventDefault();

	}

	function drag(ev) {
		ev.dataTransfer.setData("info", ev.target.id);
		
	}

	function drop(ev) {
		var arr = ev.dataTransfer.getData("info").split(" ");
		ev.preventDefault();
		
		var jobSeq = arr[0];
		var jobUserId = arr[1];
		var userId = arr[2];
		$.ajax({

		    url: "jobApplyUpdate.do?jobSeq="+jobSeq+"&userId="+userId+"&jobUserId="+jobUserId,

		    success: function(data){
		    	alert("장바구니에 담겼습니다.");
		    },

		    error: function (request, status, error){        
		    	alert("오류가 발생했습니다. 다시 시도해주세요.");
		    }
		  });
	}
	</script>

	<h1>모아보기</h1><br>
	<div class="wrapper">
		<c:forEach items="${list}" var="JobDto">
			<div class="dragInner" id="${JobDto.jobSeq} ${JobDto.userId} ${loginInfo.userId}" onclick="location.href='main_jobDetail.do?jobSeq=${JobDto.jobSeq}'" draggable="true" ondragstart="drag(event)">
				<span>${JobDto.jobSeq}</span>
				<span>${JobDto.jobTitle}</span>
				<span>${JobDto.userId}</span>
				<span>${JobDto.jobDate}</span>
				<span>${JobDto.jobView}</span>
			</div>
		</c:forEach>
	</div>
	
	<!-- 사이드바 기능 -->
	<div id="wrap">
		<aside id="sidebar">
			<br><br>
				<div class="sideMenu" ondrop="drop(event)" ondragover="dragEnter(event)" align="center"><img src="/resources/images/icon_bag.svg" width="150" height="100" onclick="location.href='mypage_main.do'" ></div><br><br>
				<div class="sideMenu" align="center"><img src="/resources/images/icon_search_image.svg" width="150" height="100" onclick="location.href='editor.do;'"></div>
			<button><span class="btn_t">OPEN</span></button>
		</aside>
	</div>

	<!-- footer -->
 	<div id = "footer"><%@ include file="/WEB-INF/views/footer.jsp" %></div>
</body>
</html>