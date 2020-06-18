<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>处理界面</title>
</head>
<body>
<%
Connection con=null;
Statement stmt=null;
ResultSet res=null;
try{
	int result=0;
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/shopping_system";
	String user="root";
	String pass="12345";
	con=DriverManager.getConnection(url,user,pass);
	stmt=con.createStatement();
	String user_goods_collect_id=(String)session.getAttribute("user_goods_collect_id");
	String shopcar_id=(String)session.getAttribute("shopcar_id");
	String sql1="insert into goods_collect_table values('"+user_goods_collect_id+"','"+request.getParameter("move")+"');";
	stmt.execute(sql1);
	String sql2="delete from shopcar_table where shopcar_id='"+shopcar_id+"' and goods_id='"+request.getParameter("move")+"';";
	stmt.execute(sql2);
	String sql3="select * from goods_table where goods_id='"+request.getParameter("move")+"';";
	res=stmt.executeQuery(sql3);
	while(res.next()){
		out.print("物品");
		out.print(res.getString("goods_name"));
		out.print("已成功移动到你的收藏夹！");
	}
%>
<br><a href="shopcarPage.jsp">返回购物车</a>
<%
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