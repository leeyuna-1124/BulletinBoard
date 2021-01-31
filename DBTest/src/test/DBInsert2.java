package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DBInsert2 {

	public static void main(String[] args) throws Exception{//try~catch 대신에 호출한 프로시저에서 예외 처리
		String id = "IceBear", name = "아이스베어", phone = "02-1234-5678", address = "서울";
		Class.forName("com.mysql.cj.jdbc.Driver");		
		String url="jdbc:mysql://127.0.0.1:3306/is02?serverTimezone=UTC";
	    Connection conn = DriverManager.getConnection(url, "root", "1234");
	    
	    String sql = "insert into users (id, name, phone, address) values (?, ?, ?, ?)";
	    PreparedStatement st = conn.prepareStatement(sql);
	    st.setString(1, id);
	    st.setString(2, name);
	    st.setString(3, phone);
	    st.setString(4, address);//순서가 바뀌어도 상관없음
	    
	    int n = st.executeUpdate();
	    System.out.println("입력갯수:"+n);
	    
	    st.close();
	    conn.close();

	}

}
