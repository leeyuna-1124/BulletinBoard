package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBDelete {

	public static void main(String[] args) {
		
		try{Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://127.0.0.1:3306/is02?serverTimezone=UTC";
		Connection conn = DriverManager.getConnection(url, "root", "1234");
		Statement st = conn.createStatement();
		String sql = "update users set name='김길동' where id = 'hong'";
		int n = st.executeUpdate(sql);
		System.out.println("수정갯수"+n);
		st.close();
		conn.close();
		
	}catch (Exception e) {
		System.out.println(e.getMessage());
	}
		

	}

}
