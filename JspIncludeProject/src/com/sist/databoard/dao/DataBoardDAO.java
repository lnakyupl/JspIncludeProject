package com.sist.databoard.dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import javax.print.attribute.ResolutionSyntax;

public class DataBoardDAO {
	private Connection conn;
	private PreparedStatement ps;

	public void getConnection() {
		try {
			Context init = new InitialContext();
			Context c = (Context) init.lookup("java:/comp/env");
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			conn = ds.getConnection();
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

	public ArrayList<DataBoardVO> boardTopData() {
		ArrayList<DataBoardVO> list = new ArrayList<DataBoardVO>();
		try {
			getConnection();
			String sql = "select no, subject, rownum from (select no, subject from databoard order by hit desc) where rownum<=5";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				DataBoardVO vo = new DataBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}

	public ArrayList<DataBoardVO> boardListData(int page) {
		ArrayList<DataBoardVO> list = new ArrayList<DataBoardVO>();
		try {
			getConnection();
			int rowSize = 10;
			int start = (page * rowSize) - rowSize - 1;
			int end = page * rowSize;
			String sql = "select no , subject, name , regdate, hit, num FROM (select no, subject, name, regdate, hit, rownum as num from(select no, subject, name, regdate, hit from databoard order by no desc)) where num between ? and ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				DataBoardVO vo = new DataBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setRegdate(rs.getDate(4));
				vo.setHit(rs.getInt(5));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
		return list;
	}

	public int databoardTotalPage() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*)/10) FROM databoard";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
		return total;
	}

	public void databoardInsert(DataBoardVO vo) {
		try {
			getConnection();
			String sql = "insert into databoard values(db_no_seq.nextval,?,?,?,?,sysdate,0,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getFilename());
			ps.setInt(6, vo.getFilesize());
			ps.executeQuery();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
	}

	public DataBoardVO databoardDetailData(int no) {
		DataBoardVO vo = new DataBoardVO();
		try {
			getConnection();
			String sql = "UPDATE databoard SET " + "hit=hit+1 " + "WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();

			// 실제 데이터
			sql = "SELECT no,name,subject,content,regdate,hit," + "filename,filesize " + "FROM databoard "
					+ "WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setRegdate(rs.getDate(5));
			vo.setHit(rs.getInt(6));
			vo.setFilename(rs.getString(7));
			vo.setFilesize(rs.getInt(8));
			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return vo;
	}

	public DataBoardVO databoardFileInfo(int no) {
		DataBoardVO vo = new DataBoardVO();
		try {
			getConnection();
			String sql = "SELECT filename,filesize FROM databoard WHERE no=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();

			vo.setFilename(rs.getString(1));
			vo.setFilesize(rs.getInt(2));

			rs.close();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			disConnection();
		}
		return vo;
	}

	public boolean databoardDelete(int no, String pwd) {
		boolean flag = false;
		try {
			getConnection();
			String sql = "select pwd from databoard where no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String db_pwd = rs.getString(1);
			rs.close();
			if (db_pwd.equals(pwd)) {
				flag = true;
				sql = "delete from databoard where no=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeQuery();
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			disConnection();
		}
		return flag;
	}
}