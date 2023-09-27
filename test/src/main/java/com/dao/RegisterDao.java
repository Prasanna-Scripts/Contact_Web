package com.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Register;

public class RegisterDao {
	private Connection con;

	public RegisterDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean RegisterInsert(Register r) {
		boolean insert = false;
		try {
			String sql = ("insert into truecaller.register(name,email,password) values(?,?,?)");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, r.getName());
			ps.setString(2, r.getEmail());
			ps.setString(3, r.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				insert = true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return insert;
	}
	
	public Register Login(String email,String pass) {
		Register reg=null;
		try {
			String sql = "select * from truecaller.register where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
		
			ps.setString(1,email);
			ps.setString(2,pass);

			ResultSet rs =ps.executeQuery();

			
			
			while(rs.next()) {
				reg=new Register();
				reg.setId(rs.getInt(1));
				reg.setName(rs.getString(2));
				reg.setEmail(rs.getString(3));
				reg.setPassword(rs.getString(4));
				System.out.print("----------i value:"+rs.getString(2)+":end");

			}
		} catch (Exception e) {
	
			e.printStackTrace();
		}
		return reg;
	}

}
