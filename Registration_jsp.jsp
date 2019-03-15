<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
Connection con = null;
ResultSet rs = null;

try{
	String username=request.getParameter("username");
	String email=request.getParameter("email");	
	String password= request.getParameter("password");
	String firstname=request.getParameter("firstname");
	String lastname=request.getParameter("lastname");	
	int mobile=Integer.parseInt(request.getParameter("mobile"));
	
	String connectionURL="jdbc:oracle:thin:@localhost:1521:xe";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection(connectionURL,"hr","hr");
	
	String query= "insert into registration values(?,?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1,username);
	ps.setString(2,email);
	ps.setString(3,password);
	ps.setString(4,firstname);
	ps.setString(5,lastname);
	ps.setInt(6,mobile);
	int i=ps.executeUpdate();
	if(i>0)
	{
		System.out.println("hello");
		out.println("Customer Record Is Successfully Saved");
	}
	else
	{
		out.println("Customer Record Is Not Saved");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
finally{
	//rs.close();
	//con.close();
}
%>