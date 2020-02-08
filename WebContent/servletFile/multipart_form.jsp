<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>multipart Test</title>
</head>
<body>
<section>
	<article>
	<form action="multipart_data.jsp" method="post" enctype="multipart/form-data">
		text1: <input type="text" name="text1">
		file1 : <input type="file" name="file1">
		file2 : <input type="file" name="file2">
		<input type="submit" value="전송">
	</form>
	</article>
</section>
</body>
</html>