package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entity.Job;

public class jobDAO {
	
	private Connection con;

	public jobDAO(Connection con) {
		super(); 
		this.con = con;
	}
	
	public boolean addJobs(Job j) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into jobs(title,description,category,status,location) values(?,?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			

			int i = ps.executeUpdate();
			
			if(i > 0) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	public ArrayList<Job> getAllJobs(){
		
		ArrayList<Job> list = new ArrayList<Job>();
		
		Job j = null;
		
		String sql = "select * from jobs order by id desc";
		
		try {
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				j = new Job();
				
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
				list.add(j);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public Job getJob(int id){
		
		
		Job j = null;
		
		String sql = "select * from jobs where id = ?";
		
		try {
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				j = new Job();
				
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return j;
	}

	public boolean updateJob(Job j) {
	
		boolean f = false;
		
		try {
			
			String sql = "update jobs set title = ?, description = ?,category = ?,status = ?,location = ? where id = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			
			ps.setInt(6, j.getId());
			
			int i = ps.executeUpdate();
			
			if(i > 0) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	public  boolean deleteJob(int id) {
		
		boolean f = false;
		
		try {
			
			String sql = "delete from jobs where id = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			
			if(i > 0) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
public ArrayList<Job> getAllJobsForUsers(){
		
		ArrayList<Job> list = new ArrayList<Job>();
		
		Job j = null;
		
		String sql = "select * from jobs where status = ? order by id desc";
		
		try {
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Active");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				j = new Job();
				
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+"");
				
				list.add(j);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

public ArrayList<Job> getORJobs(String cat, String loc){
	
	ArrayList<Job> list = new ArrayList<Job>();
	
	Job j = null;
	
	String sql = "select * from jobs where category = ? OR location = ? order by id desc";
	
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, cat);
		ps.setString(2, loc);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			j = new Job();
			
			j.setId(rs.getInt(1));
			j.setTitle(rs.getString(2));
			j.setDescription(rs.getString(3));
			j.setCategory(rs.getString(4));
			j.setStatus(rs.getString(5));
			j.setLocation(rs.getString(6));
			j.setPdate(rs.getTimestamp(7)+"");
			
			list.add(j);
			
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	return list;
	}

public ArrayList<Job> getANDJobs(String cat, String loc){
	
	ArrayList<Job> list = new ArrayList<Job>();
	
	Job j = null;
	
	String sql = "select * from jobs where category = ? and location = ? order by id desc";
	
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, cat);
		ps.setString(2, loc);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			j = new Job();
			
			j.setId(rs.getInt(1));
			j.setTitle(rs.getString(2));
			j.setDescription(rs.getString(3));
			j.setCategory(rs.getString(4));
			j.setStatus(rs.getString(5));
			j.setLocation(rs.getString(6));
			j.setPdate(rs.getTimestamp(7)+"");
			
			list.add(j);
			
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	return list;
}

}
