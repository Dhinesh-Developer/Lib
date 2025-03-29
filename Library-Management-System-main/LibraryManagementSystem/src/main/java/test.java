import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class test {
//	private static final String url = "jdbc:mysql://localhost:3306/lib";
//	private static final String username ="root";
//	private static final String password = "root@dk";
//	private static final String FETCHALL = "select * from book";
//	private static  Connection con;
//	private static  Statement stmt;
//	private static ResultSet res;
	public static void main(String[] args) {
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//		 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib","root","root@dk");
//		 Statement stmt = con.createStatement();
//		 ResultSet res = stmt.executeQuery(FETCHALL);
//		 
//		 while(res.next()) {
//			 int id=res.getInt("id");
//			 String author = res.getString("author");
//			 String title=res.getString("title");
//			 int copies = res.getInt("copies");
//			 int year = res.getInt("year");
//			 
//		 }
//		} catch (ClassNotFoundException | SQLException e) {
//			e.printStackTrace();
//		}
		
//		

//		if(request.getMethod().equalsIgnoreCase("POST")) {
//			String name = request.getParameter("name");
//			String email = request.getParameter("email");
//			String password =request.getParameter("password");
//			try {
//				Class.forName("com.mysql.cj.jdbc.Driver");
//				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/library","root","root@dk");
//				PreparedStatement pstmt = con.prepareStatement("insert into user (name,email,password) values(?,?,?)");
//				pstmt.setString(1, name);
//				pstmt.setString(2, email);
//				pstmt.setString(3,password);
//				int x = pstmt.executeUpdate();
//				
//				if(x>0) {
//					out.println("<p>Registered successfully</p>");
//				}else {
//					out.println("<p>Enter the valid form</p>");
//				}
//				
//			} catch (ClassNotFoundException | SQLException e) {
//				e.printStackTrace();
//			}
	//	}
		
//	if(request.getMethod().equalsIgnoreCase("POST")) 
//	{
//		String email = request.getParameter("email");
//		String password = request.getParameter("password");
//		boolean isValid = false;
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/library","root","root@dk");
//			PreparedStatement pstmt = con.prepareStatement("select * from user where email=?,password=?");
//			pstmt.setString(1, email);
//			pstmt.setString(2, password);
//			ResultSet res = pstmt.executeQuery();
//			isValid=res.next();
//			pstmt.close();
//			con.close();
//			
//			
//		} catch (ClassNotFoundException | SQLException e) {
//			e.printStackTrace();
//		}
//			if(isValid) {
//				response.sendRedirect("home.jsp");
//			}else {
//				response.sendRedirect("Register.jsp");
//			}
//	}
		
		
	
		
	}

}
