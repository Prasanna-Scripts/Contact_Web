package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.entity.Contact;

public class EditContactDao {
	private Connection con;

	public EditContactDao(Connection con) {
		super();
		this.con = con;
	}

	
	public Contact getContactByID(String id){
		
		Contact c=new Contact();
		try {
	
			String sql="select * from truecaller.contact where id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
	
				c.setId(rs.getString(1));
				c.setName(rs.getString(2));
				c.setMobileno(rs.getString(3));
				c.setWork(rs.getString(4));
				c.setAbout(rs.getString(5));
			
				
			}
			
			
		}catch(Exception e) {
			
		}
		return c;
		
	}
	public Boolean updateContact(Contact c,String id) {
		Boolean update = false;
		try {
			
			String sql = "update truecaller.contact set name= ?,mobile=?,work=?,about=? where id=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getMobileno());
			ps.setString(3, c.getWork());
			ps.setString(4, c.getAbout());
			ps.setString(5, id);
			
			int i = ps.executeUpdate();

			if (i == 1) {
				update = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return update;

	}
}
