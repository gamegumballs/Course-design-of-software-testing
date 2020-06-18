<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>注册页面</title>
<link rel="stylesheet" type="text/css" href="CSS/bg.css">
<style type="text/css">
body{
background:url(Resouce/bg2.JPG) no-repeat;
background-size:cover;
}
</style>
</head>
<body>
<div id="box">
<form action="afterlogin.jsp">
<h1>用户注册</h1>
<div><label>姓名：</label><input class="text" type="text" name="username" id="username" size="20"></div>
<div><label>密码：</label><input class="text" type="password" name="password" id="password" size="20"></div>
<input type="submit" value="注册">
<input type="reset" value="重置">
</form>
</div>
</body>
</html>