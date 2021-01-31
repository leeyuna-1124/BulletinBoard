package baewha.ac.kr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.sql.DataSource;

public class UserDB {
	private static UserDB instance = null ;
	
	public static UserDB getInstance() {
		if(instance == null) 
			instance = new UserDB() ;
		
		return instance ;
	}
	
	public UserDB() {
		
	}
	
	public boolean insertUser(User user) throws Exception {
		Connection conn = getConnection();
        
    	String sql = "insert into users (id, password, name, phone, email, address, intro) " 
 			   + "            values ( ?,  ?,       ?,     ?,    ?,      ?,       ?  ) " ;
        PreparedStatement st = conn.prepareStatement(sql) ;
        st.setString(1, user.getId());
        st.setString(2, user.getPassword());
        st.setString(3, user.getName());
        st.setString(4, user.getPhone());
        st.setString(5, user.getEmail());
        st.setString(6, user.getAddress());
        st.setString(7, user.getIntro());
        
        int n = st.executeUpdate() ;
        st.close();
        conn.close();
        
        if( n > 0) return true ;
        else       return false ;
	}
	
	public User getUser(String id) throws Exception {
		User user = null ;
		
		Connection conn = getConnection();
		
		String sql = "select * from users where id = ? " ;
		PreparedStatement st = conn.prepareStatement(sql) ;
		st.setString(1, id) ;
		
		ResultSet rs = st.executeQuery() ;
		if(rs.next()) {
			//찾았을 때	
			user = new User() ;
			user.setName(rs.getString("name"));
			user.setId(rs.getString("id"));
			user.setPassword(rs.getString("password"));
			user.setPhone(rs.getString("phone"));
			user.setEmail(rs.getString("email"));
			user.setAddress(rs.getString("address"));
			user.setIntro(rs.getString("intro"));
		}
		rs.close();
		st.close();
		conn.close();
		
		return user ;
	}

	public Connection getConnection() throws NamingException, SQLException {
		Context ctx = new InitialContext() ;
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/db_mysql") ;
		Connection conn = ds.getConnection() ;
		return conn;
	}
	
	public boolean getUser2(String id, User user) throws Exception {
		boolean found = false ;
		
		Connection conn = getConnection();
		
		String sql = "select * from users where id = ? " ;
		PreparedStatement st = conn.prepareStatement(sql) ;
		st.setString(1, id) ;
		
		ResultSet rs = st.executeQuery() ;
		if(rs.next()) {
			//찾았을 때	
			found = true ;
			user.setName(rs.getString("name"));
			user.setId(rs.getString("id"));
			user.setPassword(rs.getString("password"));
			user.setPhone(rs.getString("phone"));
			user.setEmail(rs.getString("email"));
			user.setAddress(rs.getString("address"));
			user.setIntro(rs.getString("intro"));
		}
		rs.close();
		st.close();
		conn.close();
		
		return found ;
	}
	
	public boolean updateUser(User user) throws Exception{
		boolean success = false;
		
		Connection conn = getConnection();
		
		String sql = "update users set name=?, phone=?, email=?, address=?, intro=? " 
		           + "       where id = ?";
		PreparedStatement st = conn.prepareStatement(sql);
		st.setString(6, user.getId());
		st.setString(1, user.getName());
		st.setString(2, user.getPhone());
		st.setString(3, user.getEmail());
		st.setString(4, user.getAddress());
		st.setString(5, user.getIntro());
		
		int n = st.executeUpdate();
		st.close();
		conn.close();
		
		if(n>0) return true;
		else	return false;
		
	}	
	
	
	public boolean deleteUser(User user) throws Exception {
		boolean success = false ;
        Connection conn = getConnection();
		
        String sql = "delete from users where id=?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, user.getId());
	    
        int n = st.executeUpdate();
		st.close();
		conn.close();
		
		if(n>0) return true;
		else	return false;
	}
	
	public List<User> getUserList() throws Exception {
		List<User> list = new ArrayList<User>() ;
		
		Connection conn = getConnection() ;
		String sql = "select * from users " ;
		PreparedStatement st = conn.prepareStatement(sql) ;
		
		ResultSet rs = st.executeQuery() ;
		while(rs.next()) {
			User user = new User() ;
			user.setId(rs.getString("id"));
			user.setName(rs.getString("name"));
			user.setPhone(rs.getString("phone"));
			user.setEmail(rs.getString("email"));
			//....
			list.add(user) ;
			
		}
		rs.close();
		st.close();
		conn.close();		
		
		return list ;
	}

}
