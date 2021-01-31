package test;

import java.sql.*;

public class DBInsert {

	public static void main(String[] args) {
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url="jdbc:mysql://127.0.0.1:3306/is02?serverTimezone=UTC";
		Connection conn = DriverManager.getConnection(url, "root", "1234");//데이터베이스에 연결시켜줌
		System.out.println("데이터베이스 연결 성공");
		Statement st = conn.createStatement();//쿼리를 데이터베이스에 던져줌
		String q ="insert into users(id, name, phone) values ('hong', '홍길동', '010-1234-1234')";//쿼리를 만든다.
		int n = st.executeUpdate(q);//쿼리를 실행한다.
		System.out.println(n+"개가 입력되었습니다.");
		st.close();
		conn.close();
		
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버를 찾지 못했어요.");
	}catch(Exception e) {
		System.out.println(e.getMessage());
	}

}

	
	}

