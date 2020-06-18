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
	String shopcar_id=(String)session.getAttribute("shopcar_id");
	String user_goods_collect_id=(String)session.getAttribute("user_goods_collect_id");
	String sql1="insert into shopcar_table values('"+shopcar_id+"','"+request.getParameter("move2")+"');";
	stmt.execute(sql1);
	String sql2="delete from goods_collect_table where goods_collect_id='"+user_goods_collect_id+"' and goods_id='"+request.getParameter("move2")+"';";
	stmt.execute(sql2);
	String sql3="select * from goods_table where goods_id='"+request.getParameter("move2")+"';";
	res=stmt.executeQuery(sql3);
	while(res.next()){
		out.print("物品");
		out.print(res.getString("goods_name"));
		out.print("已成功移动到你的购物车！");
	}
%>
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