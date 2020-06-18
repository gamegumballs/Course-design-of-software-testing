<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="CSS/index.css">
<style type="text/css">
.big{
font-size:30px;
}
label{
font-size:20px;
}
</style>
</head>
<body>
<div id="top">
	<div class="container"></div>
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
<div>
  <div style="background-color:C0D9D9;">
    <div style="padding-top:5px;"><label class="big">用户：<%=session.getAttribute("entername")%></label></div>
    <div><label class="big">钱包余额：<%=session.getAttribute("wallet")%>元</label></div>
  </div>
  <div style="background:red;height:35px">
    <div class="left" style="padding-right:100px;padding-top:5px;"><a href="bought.jsp" target="iframe1"><label>已购买</label></a></div>
    <div class="left" style="padding-right:100px;padding-top:5px"><a href="goods_collect.jsp" target="iframe1"><label>收藏的商品</label></a></div>
    <div class="left" style="padding-right:100px;padding-top:5px"><a href="shops_collect.jsp" target="iframe1"><label>收藏的店铺</label></a></div>
    <div class="left" style="padding-right:100px;padding-top:5px"><a href="account_content.jsp" target="iframe1"><label>账户管理</label></a></div>
  </div>
</div>
<iframe name="iframe1" width="100%" height="1000" frameborder="0"></iframe>
</body>
</html>