package com.sist.temp;

import java.io.File;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

public class MainClass {
	public static void main(String[] args) {
		try {
			SAXParserFactory spf = SAXParserFactory.newInstance();
			SAXParser sp = spf.newSAXParser();
			sp.parse(new File("C:\\Users\\sist\\Desktop\\»õ Æú´õ\\JspIncludeProject\\WebContent\\xml\\dbcp.xml"), new XMLHandler());
		}catch (Exception e) {
		}
	}
}
