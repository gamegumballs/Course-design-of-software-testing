<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
	String sql1="select * from shop_table;";
	res=stmt.executeQuery(sql1);
	while(res.next()){
%>
<form action="shopPage.jsp"><input type="hidden" name="toshop" value="<%=res.getString("shop_name")%>"><input style="width:100px;" type="submit" value="<%=res.getString("shop_name")%>" width="50px;"></form>
<%
	}
%>
<form action="all_goods.jsp"><input type="hidden" name="totype1" value="best_seller"><input style="width:100px;" type="submit" value="所有"></form>
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