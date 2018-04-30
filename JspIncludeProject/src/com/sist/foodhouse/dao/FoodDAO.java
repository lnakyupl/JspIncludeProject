package com.sist.foodhouse.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.swing.plaf.synth.SynthSeparatorUI;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;

	public void getConnection() {
		try {
			Context init = new InitialContext();
			Context c = (Context) init.lookup("java:/comp/env");
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			conn = ds.getConnection();
			/*
			 * String url = "jdbc:oracle:thin:@localhost:1521:ORCL"; conn
			 * =DriverManager.getConnection(url,"scott","tiger");
			 */
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {

		}
	}

	public void foodCategoryInsert(CategoryVO vo) {
		try {
			getConnection();
			String sql = "insert into category values((select nvl(max(cateno)+1,1) from category),?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getPoster());
			ps.executeQuery();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
	}

	public ArrayList<CategoryVO> categoryAlldata() {
		ArrayList<CategoryVO> list = new ArrayList<CategoryVO>();

		try {
			getConnection();
			String sql = "select cateno, title, subject, poster from category order by cateno asc";
			
			ps= conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CategoryVO vo = new CategoryVO();
				vo.setCateNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setPoster(rs.getString(4));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}
}