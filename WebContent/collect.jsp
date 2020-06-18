<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>收藏夹</title>
<link rel="stylesheet" type="text/css" href="CSS/index.css">
<style type="text/css">
label{
font-size:30px;
}
</style>
</head>
<body>
<div id="top">
	<div class="container"></div>
</div>
<div id="header">
	<div class="container">
		<ul class="left">
			<li><a href="#">欢迎你，<%=session.getAttribute("entername")%>！</a></li>
			<li class="shop_car"><span></span><a href="shopcarPage.jsp">购物车</a></li>
		</ul>
	</div>
	<div class="right" style="padding-top:5px">
	  <form action="search.jsp">
	    <input type="text" name="search" value="点击搜索更多" size="35">
	    <input type="submit" value="搜索">
	  </form>
	</div>
</div>
<div id="nav">
	<div class="container">
		<div class="logo left">
			<img src="img/logo.png">
		</div>
		<ul class="right">
			<li><a href="MainPage.jsp">首页</a></li>
			<li><a href="class_goods.jsp">商品分类</a></li>
			<li><a href="collect.jsp">收藏夹</a></li>
			<li><a href="user.jsp">个人中心</a></li>
		</ul>
	</div>
</div>
<div style="background:red;height:50px">
  <div class="left">
    <div style="padding-top:5px;"><label><%=session.getAttribute("entername")%>的收藏夹</label></div>
  </div>
  <div class="right">
    <div style="padding-right:20px;padding-top:5px;" class="left"><a href="goods_collect.jsp" target="iframe1"><label>商品收藏</label></a></div>
    <div class="left" style="padding-top:5px"><a href="shops_collect.jsp" target="iframe1"><label>店铺收藏</label></a></div>
  </div>
</div>
<iframe name="iframe1" width="100%" height="1000" frameborder="0"></iframe>
</body>
</html>