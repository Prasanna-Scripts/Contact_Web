package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DbConnection;
import com.dao.EditContactDao;
import com.entity.Contact;


@WebServlet("/EditContactServlet")
public class EditContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String MobileNo=request.getParameter("mobile");
		String work=request.getParameter("work");
		String about=request.getParameter("about");
		
		Contact contact=new Contact(name,MobileNo,work,about);
		
		EditContactDao dao=new EditContactDao(DbConnection.getConn());
		boolean contactInsert=dao.updateContact(contact,id);
		

		HttpSession session=request.getSession();
		
			if (contactInsert) {
				session.setAttribute("contactupdatesuccess", "Contact updated successfully ");
				response.sendRedirect("ViewContact.jsp");
			} else {
				session.setAttribute("contactupdatefail", "updating contact is fail Please fill all details");
				response.sendRedirect("ViewContact.jsp");
			}

	}

}
