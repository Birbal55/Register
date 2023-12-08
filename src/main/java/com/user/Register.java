package com.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
@MultipartConfig
public class Register extends HttpServlet {
	protected void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
		res.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = res.getWriter()){
				out.println("<!DOCTYPE html>");
				out.println("<html>");
				out.println("<head>");
				out.println("<title>Servlet Register</title>");
				out.println("</head>");
				out.println("<body>");
				//getting all the incoming detail from the request..
				String name = req.getParameter("user_name");
				String email = req.getParameter("user_email");
				String password = req.getParameter("user_password");
				Part part = req.getPart("image");
				String filename = part.getSubmittedFileName();
				out.println(filename);
				
//				out.println(name);
//				out.println(password);
//				out.println(email);
				
				//connection....................
				try {
					
					Thread.sleep(3000);
					
					Class.forName("com.mysql.jdbc.Driver");
					
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/youtube","root","");
					
					//query...
					
					String q = "insert into user(name,password,email,image) values(?,?,?,?)";
					PreparedStatement pstmt = con.prepareStatement(q);
					pstmt.setString(1,name);
					pstmt.setString(2,password);
					pstmt.setString(3,email);
					pstmt.setString(4, filename);
					
					pstmt.executeUpdate();
					//upload...
					InputStream is = part.getInputStream();
					byte []data = new byte[is.available()];
					
					is.read(data);
					String path = req.getRealPath("/")+"img"+File.separator+filename;
//					out.println(path);/
					FileOutputStream fos = new FileOutputStream(path);
					fos.write(data);
					fos.close();
					out.println("done");
				}catch(Exception e){
					e.printStackTrace();
					out.println("error");
				}
		
				
				out.println("</body>");
				out.println("</html>");
		}
	}
}
