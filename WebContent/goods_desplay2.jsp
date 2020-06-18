<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>商品详细信息</title>
<script type="text/javascript">
function warm_or_not(){
	var user=document.getElementById("usernamee").value;
	if(!(user!=null&&user!="null")){
		window.location.href="goods_desplay.jsp?index="+user;
		alert("你还没登录！请先登录！");
	}
}
</script>
<style type="text/css">
li{
list-style:none;
}
label{
font-size:30px;
}
.side{
height:50px;
}
</style>
</head>
<body>
<%
Connection con=null;
Statement stmt=null;
ResultSet res=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/shopping_system";
	String user="root";
	String pass="12345";
	con=DriverManager.getConnection(url,user,pass);
	stmt=con.createStatement();
	String sql="select * from goods_table where goods_id='"+request.getParameter("goods_information")+"';";
	res=stmt.executeQuery(sql);
	while(res.next()){
		String goods_path="Resouce/"+res.getString("goods_image");
%>
<div style="height:300px;padding-top:50px;padding-left:50px;">
  <div style="float:left;">
    <img src="<%=goods_path%>" width="300px" height="300px">
  </div>
  <div style="float:left">
    <div style="padding-left:0px">
        <div class="side"><label>商品名称：<%=res.getString("goods_name")%></label></div>
        <div class="side"><label>商品描述：<%=res.getString("goods_information")%></label></div>
        <div class="side"><label>售价：<%=res.getDouble("goods_value")%>元</label></div>
        <div class="side"><label>所属店铺：<%=res.getString("shop_name")%></label></div>
    </div>
    <div style="height:100px">
      <div style="float:left;padding-top:78px;"><form action="tocollect.jsp" method="post" onsubmit="warm_or_not()"><input type="hidden" name="tocollect" value="<%=res.getString("goods_id")%>"><input type="submit" value="添加到收藏夹"></form></div>
    </div>
  </div>
<%
	}
}catch(ClassNotFoundException e){
	e.printStackTrace();
	out.print("驱动加载失败");
}catch(SQLException ex){
	ex.printStackTrace();
	out.print("用户名或密码错误");
}finally{
	if(res!=null){res.close();}
	if(stmt!=null){stmt.close();}
	if(con!=null){con.close();}
}
%>
</body>
</html>