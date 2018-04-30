package com.sist.member.dao;

import java.util.*;
import java.sql.*;
import javax.naming.*; // context
import javax.sql.*; // datasource ( 데이터베이스의 정보)

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;

	private void getConnection() {
		try {
			Context init = new InitialContext();
			Context c = (Context) init.lookup("java:/comp/env");
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	private void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public int idCheck(String id) {
		int count = 0;
		try {
			getConnection();

			String sql = "select count(*) from food_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}

		return count;
	}

	public ArrayList<ZipcodeVO> postfind(String dong) {
		ArrayList<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
		try {
			getConnection();
			String sql = "SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') FROM zipcode WHERE dong LIKE '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dong);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ZipcodeVO vo = new ZipcodeVO();
				vo.setZipcode(rs.getString(1));
				vo.setSido(rs.getString(2));
				vo.setGugun(rs.getString(3));
				vo.setDong(rs.getString(4));
				vo.setBunji(rs.getString(5));
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}

	public int postfindCount(String dong) {
		int count=0;
		ArrayList<ZipcodeVO> list = new ArrayList<ZipcodeVO>();
		try {
			getConnection();
			String sql = "SELECT count(*) from zipcode WHERE dong LIKE '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dong);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return count;
	}
	public void memberJoin(MemberVO vo) {
		
	}
}
