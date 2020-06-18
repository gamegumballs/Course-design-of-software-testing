<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>结算</title>
</head>
<body>
<%
Connection con=null;
Statement stmt=null;
ResultSet res=null;
try{
	double costmoney=0;
	double money=0;
	double rest=0;
	int result=0;
	String user_id_string=(String)session.getAttribute("user_id");
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/shopping_system";
	String user="root";
	String pass="12345";
	con=DriverManager.getConnection(url,user,pass);
	stmt=con.createStatement();
	String user_id=(String)session.getAttribute("user_id");
	String shopcar_id=(String)session.getAttribute("shopcar_id");
	String sql1="select wallet from user_table where user_id='"+user_id+"';";
	String[] shuigou=request.getParameterValues("goods");		
	for (int i = 0; i < shuigou.length; i++) {
		String sql2="select goods_value from goods_table where goods_id='"+shuigou[i]+"';";
		res=stmt.executeQuery(sql2);
		while(res.next()){
			costmoney=costmoney+res.getDouble("goods_value");
		}
	}
	res=stmt.executeQuery(sql1);
	while(res.next()){
		money=res.getDouble("wallet");
	}
	rest=money-costmoney;
	if(rest>=0){
	out.print("你此次一共消费了：");
	out.print(costmoney);
	out.print("元");
	session.setAttribute("wallet",rest);
%>
<br><%="你还有："%><%=rest%><%="元"%>
<%
	for(int i=0;i<shuigou.length;i++){
		String sql3="insert into user_goods_table value('"+shuigou[i]+"','"+user_id_string+"');";
		stmt.execute(sql3);
		String sql4="delete from shopcar_table where goods_id='"+shuigou[i]+"' and shopcar_id='"+shopcar_id+"';";
		stmt.execute(sql4);
	}
    String rest_string=rest+"";
    String sql5="update user_table set wallet="+rest_string+" where user_id='"+user_id+"';";
    stmt.execute(sql5);
	}
	else{
		out.print("对不起！你的余额已不足,无法购买！");
	}
%>
<br>
<%
}catch(ClassNotFoundException e){
	e.printStackTrace();
	out.print("驱动加载失败");
}finally{
	if(res!=null){res.close();}
	if(stmt!=null){stmt.close();}
	if(con!=null){con.close();}
}
%>
<a href="shopcarPage.jsp">返回购物车</a>
</body>
</html>