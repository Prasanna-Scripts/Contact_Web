package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;


public class AddContactDao {
	private Connection con;

	public AddContactDao(Connection con) {
		super();
		this.con = con;
	}

	public Boolean addContact(Contact c) {
		Boolean insert = false;
		try {
			
			String sql = "insert into truecaller.contact (name,mobile,work,about) values (?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getMobileno());
			ps.setString(3, c.getWork());
			ps.setString(4, c.getAbout());
			
			
			int i = ps.executeUpdate();

			if (i == 1) {
				insert = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return insert;

	}
	
	public List<Contact> getAllContact(String id){
		List<Contact> list=new ArrayList<Contact>();
		Contact c=null;
		try {
			String sql="select * from truecaller.contact";
			PreparedStatement ps=con.prepareStatement(sql);
			//ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Contact();
				c.setId(rs.getString(1));
				c.setName(rs.getString(2));
				c.setMobileno(rs.getString(3));
				c.setWork(rs.getString(4));
				c.setAbout(rs.getString(5));
				list.add(c);
				
			}
			
			
		}catch(Exception e) {
			
		}
		return list;
		
	}
}