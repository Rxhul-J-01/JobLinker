package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class userDAO {

	private Connection con;

	public userDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addUser(User u) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into user(name,qualification,email,password,role) values(?,?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setString(5, "user");
			
			int i = ps.executeUpdate();
			
			if(i > 0) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User Login(String email, String pass) {
		
		User u = null;
		
		try {
			
			String Sql = "select * from user where email = ? and password = ?";
			
			PreparedStatement ps = con.prepareStatement(Sql);
			ps.setString(1, email);
			ps.setString(2, pass);

			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setQualification(rs.getString(5));
				u.setRole(rs.getString(6));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return u;
	}
	
public boolean updateUser(User u) {
		
		boolean f = false;
		
		try {
			
			String sql = "update user set name = ?,qualification = ?,email = ?,password = ? where id = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, u.getName());
			ps.setString(2, u.getQualification());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setInt(5, u.getId());			
			int i = ps.executeUpdate();
			
			if(i > 0) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
