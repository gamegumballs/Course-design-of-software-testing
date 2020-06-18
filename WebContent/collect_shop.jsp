<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>收藏店铺</title>
</head>
<body>
<%
String entername=(String)session.getAttribute("entername");
if(!(entername!=null)){
	out.print("亲，不要着急哦！你还没登录呢");
}
else{
Connection con=null;
Statement stmt=null;
ResultSet res=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/shopping_system";
	String user="root";
	String pass="12345";
	String shop_id="";
	con=DriverManager.getConnection(url,user,pass);
	stmt=con.createStatement();
	String shops_collect_id=(String)session.getAttribute("shops_collect_id");
	String sql1="select * from shop_table where shop_name='"+request.getParameter("collect_shop")+"';";
	res=stmt.executeQuery(sql1);
	while(res.next()){
		out.print("你已经成功收藏了本店！");
		shop_id=res.getString("shop_id");
	}
	String sql2="insert into shops_collect_table values('"+shops_collect_id+"','"+shop_id+"','"+request.getParameter("collect_shop")+"');";
	stmt.execute(sql2);
%>
<%
}catch(ClassNotFoundException e){
	e.printStackTrace();
	out.print("驱动加载失败");
}finally{
	if(res!=null){res.close();}
	if(stmt!=null){stmt.close();}
	if(con!=null){con.close();}
}
}
%>
</body>
</html>