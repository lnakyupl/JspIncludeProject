package com.sist.change;

public class JspChange {
	public static String[] jsp = { "home.jsp", "../member/join.jsp", "../foodhouse/foodhouse.jsp", "../databoard/update.jsp", "../databoard/databoard.jsp" };

	public static String[] databoard_jsp= {
		"list.jsp",
		"insert.jsp",
		"detail.jsp"
		
	};
	public static String databoard_change(int no) {
		return databoard_jsp[no];
	}
	public static String change(int no) {
		return jsp[no];
	}
}
