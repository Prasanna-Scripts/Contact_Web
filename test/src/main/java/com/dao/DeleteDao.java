package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Contact;

public class DeleteDao {
	private Connection con;

	public DeleteDao(Connection con) {
		super();
		this.con = con;
	}


	public Boolean deleteContact(Contact c,String id) {
		Boolean delete = false;
		try {
			
			String sql = "delete from truecaller.contact where id=?";

			PreparedStatement ps = con.prepareStatement(sql);
		
			ps.setString(1, id);
		
			int i = ps.executeUpdate();

			if (i == 1) {
				delete = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return delete;

	}
}
