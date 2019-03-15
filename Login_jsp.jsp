 <%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
Connection con = null;
ResultSet rs = null;

try{
	
	String username= request.getParameter("username");
	String Password= request.getParameter("password");
	
	String connectionURL= "jdbc:oracle:thin:@localhost:1521:xe";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection(connectionURL,"hr","hr");
	
	String query= "select * from registration where username = ? and password = ?";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1,username);
	ps.setString(2,Password);
	rs=ps.executeQuery();
	
	if(rs.next())
	{
		out.println("login successfull");
	}
	else
	{
		out.println("not available");
	}
	
}
	catch(Exception e)
	{
		System.out.println("Some error ..........");
		e.printStackTrace();
	}
	finally{
		//rs.close();
		//rs=null;
		//con.close();
	}
%>