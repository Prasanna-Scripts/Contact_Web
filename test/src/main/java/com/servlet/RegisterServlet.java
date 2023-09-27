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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		Register user = new Register(name, email, password);

		RegisterDao dao = new RegisterDao(DbConnection.getConn());
		boolean register = dao.RegisterInsert(user);

		
		HttpSession session=req.getSession();
		
			if (register) {
				session.setAttribute("success", "Registration Success Welcome "+ user.getName());
				session.setAttribute("username",user.getName());
				
				res.sendRedirect("index.jsp");
			} else {
				session.setAttribute("fail", "Registration fail Please fill all details");
				res.sendRedirect("Register.jsp");
			}

		
	}

}
