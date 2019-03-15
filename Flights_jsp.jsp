<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%

Connection con = null;
ResultSet rs = null;

String trip_type=request.getParameter("trip_type");
String flight_from=request.getParameter("flight_from");
String flight_to=request.getParameter("flight_to");
Date depart_date=new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("Depart_Date"));

out.println(depart_date);

try{
		
	String connectionURL= "jdbc:oracle:thin:@localhost:1521:xe";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection(connectionURL,"hr","hr");
	
	String query="select * from flights where flight_from=? and flight_to=? and depart_Date=?";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1,flight_from);
	ps.setString(2,flight_to);
	ps.setDate(3,new java.sql.Date(depart_date.getTime()));
	rs=ps.executeQuery();

	out.println("<h1 align=center>Available Flights Are : </h1>");
	while(rs.next())
	{
		
		out.println("<br><br>");
		out.println("<table   align=center><tr>");
		out.println("<td>      Flight ID</td><td>"+rs.getInt(1)+"</td></tr>");
		out.println("<tr><td>       Source</td><td>"+rs.getString(2)+"</td></tr>");
		out.println("<tr><td>      Destination </td><td>"+rs.getString(3)+"</td></tr>");
		out.println("<tr><td>         Date </td><td>"+rs.getDate(4)+"</td></tr>");
		out.println("<tr><td>        Time </td><td>"+rs.getString(5)+"</td></tr>");
		out.println("</table>");	
		out.println("<hr>");	
}
}
catch(Exception e)
{
	e.printStackTrace();
}
finally{
	//rs.close();
	con.close();
}
%>