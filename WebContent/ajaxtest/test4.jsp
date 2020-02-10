<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
  <script type="text/javascript">
  	window.onload = function () {
		var link = document.getElementById('link');
		link.onclick = function(e) {
			e.preventDefault();
			asyncSend();
		}
	}
  	function getXHR() {
		var req;
		try{
			req = new XMLHttpRequest();
		}catch(e){
			try{
				req = new ActiveXObject("Msxm.12XMLHTTP");
			}catch(e){
				req = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		return req;
	}
  	function asyncSend() {
		var req = getXHR();
		req.onreadystatechange = function() {
			var data = document.getElementById("data");
			if(req.readyState == 4){
				if(req.status == 200){
					data.innerHTML = req.responseText;
				}else{
					data.innerHTML = "서버에러";
				}
			}else{
				data.innerHTML = "통신중..."
			}
		}
		req.open('GET', 'ajaxtest.jsp', true);
		req.send(null);
	}
  </script>
<body>
<div id="data">여기에 데이터 표시</div>
<a id="link" href="ajaxtest.txt">데이터 불러오기</a>

</body>
</html>