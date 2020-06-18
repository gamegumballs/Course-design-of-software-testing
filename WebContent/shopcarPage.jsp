<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>购物车页面</title>
<link rel="stylesheet" type="text/css" href="CSS/index.css">
<style type="text/css">
#heixian{
border:1px solid black;
}
</style>
<script type="text/javascript">
function check_all(){
	var all=document.getElementsByName("goods");
	for(var i=0;i<all.length;i++){
	all[i].checked=true;
	}
}
function cancel_all(){
	var c=document.getElementsByName("goods");
	for(var i=0;i<c.length;i++){
	c[i].checked=false;
	}
}
</script>
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
			<div style="padding-top:20px;padding-left:50px;padding-bottom:5px;">
		      <h3 style="font-size:30px;">购物车(<%=session.getAttribute("entername")%>)</h3>
		    </div>
	</div>
		
		<div class="right">
		<ul>
			<li><a href="MainPage.jsp">首页</a></li>
			<li><a href="class_goods.jsp">商品分类</a></li>
			<li><a href="collect.jsp">收藏夹</a></li>
			<li><a href="user.jsp">个人中心</a></li>
		</ul>
		</div>
	</div>
</div>
<div style="float:left">
<form action="jiesuan.jsp" action="post">
  <table width="80%" align="center">
    <tr>
      <th></th>
      <th align="left">商品名称</th>
      <th align="left">商品描述</th>
      <th align="left">价格</th>
      <th align="right">操作</th>
    </tr>
<%
Connection con=null;
Statement stmt=null;
ResultSet res=null;
try{
	int i=1;
	int result=0;
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/shopping_system";
	String user="root";
	String pass="12345";
	con=DriverManager.getConnection(url,user,pass);
	stmt=con.createStatement();
	String shopcar_id=(String)session.getAttribute("shopcar_id");
	String sql1="select * from shopcar_table,goods_table where shopcar_table.goods_id=goods_table.goods_id and shopcar_id='"+shopcar_id+"';";
	res=stmt.executeQuery(sql1);
	while(res.next()){
		String image_path="Resouce/"+res.getString("goods_image");
		String i_string=i+"";
%>
  <tr>
    <td width="20%">
      <div style="float:left">
        <div style="float:left">
            <input type="checkbox" name="goods" value="<%=res.getString("goods_table.goods_id")%>">
        </div>
        <div style="float:left">
            <form>
            <input type="submit" value="">
            </form>
            <label>店铺：<%=res.getString("shop_name")%></label>
        </div>
      </div>
    <img src="<%=image_path%>" width="160px" height="160px">
    </td>
    <td><%=res.getString("goods_name")%></td>
    <td><%=res.getString("goods_information")%></td>
    <td><%=res.getString("goods_value")%></td>
    <td align="right">
      <div style="margin-bottom:10px;">
        <form action="delete.jsp"><input type="hidden" name="delete" value="<%=res.getString("goods_table.goods_id")%>"><input type="submit" value="删除"></form>
      </div>
      <div style="margin-bottom:10px;">
        <form action="move_to_collect.jsp"><input type="hidden" name="move" value="<%=res.getString("goods_table.goods_id")%>"><input type="submit" value="移动到收藏夹"></form>
      </div>
      <div>
        <form action="shopPage.jsp"><input type="hidden" name="toshop" value="<%=res.getString("shop_name")%>"><input type="submit" value="进 入该店看看"></form>
      </div>
    </td>
  </tr>
<%
    i++;
	}
	session.setAttribute("goods_sum",i);
}catch(ClassNotFoundException e){
	e.printStackTrace();
	out.print("驱动加载失败");
}finally{
	if(res!=null){res.close();}
	if(stmt!=null){stmt.close();}
	if(con!=null){con.close();}
}
%>
  <tr>
    <td>
        <div style="float:left;">
          <input type="button" value="全选" onClick="check_all()">
          <input type="button" value="全不选" onClick="cancel_all()">
        </div>
    </td>
    <td colspan="4" align="right"><input type="submit" value="结算"></td>
  </tr>
  </table>
 </form>
</div>
</body>
</html>