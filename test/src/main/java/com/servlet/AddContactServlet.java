package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DbConnection;
import com.dao.AddContactDao;
import com.entity.Contact;

@WebServlet("/AddContactServlet")
public class AddContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String MobileNo=request.getParameter("mobile");
		String work=request.getParameter("work");
		String about=request.getParameter("about");
		
		Contact contact=new Contact(name,MobileNo,work,about);
		
		AddContactDao dao=new AddContactDao(DbConnection.getConn());
		boolean contactInsert=dao.addContact(contact);
		

		HttpSession session=request.getSession();
		
			if (contactInsert) {
				session.setAttribute("contactsuccess", "Contact added successfully ");
				response.sendRedirect("AddContact.jsp");
			} else {
				session.setAttribute("contactfail", "Adding new contact is fail Please fill all details");
				response.sendRedirect("AddContact.jsp");
			}

		
		
	}
	



}
