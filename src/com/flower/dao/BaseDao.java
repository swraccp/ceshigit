package com.flower.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

/**
 * 数据库帮助类
 * @author ljn
 *
 */
public class BaseDao {
	
	private static String driver;
	private static String url;
	private static String user;
	private static String password;
	Connection conn=null;
	public static void init() {
		//创建properties对象
		Properties p=new Properties();
		//保存路径
		String path="database.properties";
		//把配置文件中的内容通过输入流读取到basedao中
		InputStream is=BaseDao.class.getClassLoader().getResourceAsStream(path);
		try {
			//从输入流中加载properties文件
			p.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//
		driver=p.getProperty("driver");
		url=p.getProperty("url");
		user=p.getProperty("user");
		password=p.getProperty("pwd");
	}
	static {
		init();
	}
	

	public Connection getConn() {
		if(conn==null) {
			try {
				Class.forName(driver);
				conn=DriverManager.getConnection(url,user,password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return conn;
	}
	public void closeAll(Connection conn,PreparedStatement pstmt,ResultSet rs) {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
