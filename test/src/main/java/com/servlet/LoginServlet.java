package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DbConnection;
import com.dao.RegisterDao;
import com.entity.Register;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		RegisterDao dao=new RegisterDao(DbConnection.getConn());
		Register login=dao.Login(email, password);
		
		HttpSession session=request.getSession();
		
		if (login != null) {
			
			session.setAttribute("logsuccess",login.getName());
			session.setAttribute("username",login.getName());
			session.setAttribute("logid",login.getId());
			response.sendRedirect("index.jsp");
		} else {
			session.setAttribute("logfail", "Login fail");
			response.sendRedirect("Login.jsp");
		}

		
		
	}

}
