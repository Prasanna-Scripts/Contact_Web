package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DbConnection;
import com.dao.DeleteDao;
import com.entity.Contact;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id=request.getParameter("cId");
		String name=request.getParameter("name");
		String MobileNo=request.getParameter("mobile");
		String work=request.getParameter("work");
		String about=request.getParameter("about");
		
		Contact contact=new Contact(name,MobileNo,work,about);
		
		DeleteDao dao=new DeleteDao(DbConnection.getConn());
		boolean contactInsert=dao.deleteContact(contact,id);
		

		HttpSession session=request.getSession();
		
			if (contactInsert) {
				session.setAttribute("contactdeletesuccess", "Contact deleted successfully ");
				response.sendRedirect("ViewContact.jsp");
			} else {
				session.setAttribute("contactdeletefail", "deleting contact is fail");
				response.sendRedirect("ViewContact.jsp");
			}

	}
}
