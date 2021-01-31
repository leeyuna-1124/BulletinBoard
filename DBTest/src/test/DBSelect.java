package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBSelect {

	public static void main(String[] args) {
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://127.0.0.1:3306/is02?serverTimezone=UTC";
		Connection conn = DriverManager.getConnection(url, "root", "1234");
		System.out.println("데이터베이스 연결 성공");
		
		Statement st = conn.createStatement();
		
		String q ="select * from users";
		st.executeQuery(q);
		ResultSet rs = st.executeQuery(q);//sql질의문의 결과를 추상화한 인터페이스
		
		while(rs.next()) {
			System.out.println(rs.getString("id")+","+rs.getString("name"));
		}
		st.close();
		conn.close();
		rs.close();
	}catch(ClassNotFoundException e) {
		System.out.println("드라이버를 찾지 못했어요.");
}catch(Exception e) {
	System.out.println(e.getMessage());

}
	}
}
