<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录界面</title>
<link rel="stylesheet" type="text/css" href="CSS/bg.css">
<style type="text/css">
body{
background:url(Resouce/bg1.JPG) no-repeat;
background-size:cover;
}
</style>
</head>
<body>
<div id="box">
<form action="afterenter.jsp">
<h1>用户登录</h1>
<div><label>姓名：</label><input class="text" type="text" name="login_name" id="login_name" size="20"></div>
<div><label>密码：</label><input class="text" type="password" name="login_password" id="login_password" size="20"></div>
<input type="submit" value="登录">
<input type="reset" value="重置"><br>
<a href="login.jsp">没有账户？点击这里免费注册</a>
</form>
</div>
</body>
</html>