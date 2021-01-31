	package baewha.ac.kr;

	import java.sql.*;
	import java.util.ArrayList;
	import java.util.List;

	import javax.naming.Context;
	import javax.naming.InitialContext;
import javax.servlet.annotation.WebServlet;
import javax.sql.DataSource;

	public class BoardDBBean {
		private static BoardDBBean instance = new BoardDBBean();
		public static BoardDBBean getInstance() {
			return instance ;
		}
		
		private Connection getConnection() throws Exception {
			Context ctx = new InitialContext() ;
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/db_mysql") ;
			return ds.getConnection() ;		
		}
		private void insertArticle0(BoardDataBean data) throws Exception{
			if(data.getNum()==0) {
				data.setRef(0);
				data.setRe_level(0);
				data.setRe_step(0);
			}else {
				BoardDataBean org = getArticle(data.getNum());
				if(org !=null) {
					data.setRef(org.getRef());
					data.setRe_level(org.getRe_level()+1);
					data.setRe_step(org.getRe_step()+1);
					
					Connection con = getConnection();
					String sql = "update board set re_step=re_step+1"
							+ "  where ref=? and re_step > ?" ; //원글보다 늦게 들어온(큰) 글에 대해서
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setInt(1, org.getRef());
					ps.setInt(2,  org.getRe_step());
					ps.executeUpdate();
					ps.close();
				}
			}
		}
		
		public void insertArticle(BoardDataBean data) throws Exception {
			insertArticle0(data);
			
			Connection conn = getConnection() ;
			
			String sql = "insert into board(writer, email, subject, passwd, reg_date, content,"
					+    "                 ref, re_step, re_level, ip) "
					+    "         values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) " ;
			PreparedStatement st = conn.prepareStatement(sql) ;
			st.setString(1, data.getWriter());
			st.setString(2, data.getEmail());
			st.setString(3, data.getSubject());
			st.setString(4, data.getPasswd());
			st.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			st.setString(6, data.getContent());
			st.setInt(7, data.getRef());
			st.setInt(8, data.getRe_step());
			st.setInt(9, data.getRe_level());
			st.setString(10, data.getIp());
			st.executeUpdate() ;
		
            if(data.getRef() == 0){ //원글일 경우에만 새로운 ref값을 넣는다.
			ResultSet rs = st.executeQuery("SELECT last_insert_id()") ;
			rs.next() ; 
			int num = rs.getInt(1) ;
			st.executeUpdate("update board set ref = " + num + " where num = "  + num) ;
            }
			st.close() ;
			conn.close(); 
		}
		
		public BoardDataBean getArticle(int num)  throws Exception {
			Connection conn = getConnection() ;
			String sql = "select * from board where num = ? " ;
			PreparedStatement ps = conn.prepareStatement(sql) ;
			ps.setInt(1, num);
			ResultSet rs = ps.executeQuery() ;
			BoardDataBean item = new BoardDataBean() ;
			if(rs.next()) {
				item.setNum(rs.getInt("num"));
				item.setWriter(rs.getString("writer"));
				item.setEmail(rs.getString("email"));
				item.setSubject(rs.getString("subject"));
				item.setSubject(rs.getString("passwd"));
				item.setContent(rs.getString("content"));
				item.setIp(rs.getString("ip"));
				item.setReg_date(rs.getTimestamp("reg_date"));
				item.setReadcount(rs.getInt("readcount"));
				item.setRe_step(rs.getInt("re_step"));
				item.setRe_level(rs.getInt("re_level"));
				item.setRef(rs.getInt("ref"));			
			}
			rs.close();
			ps.close();
			conn.close();
			return item ;
		}
		
		public BoardDataBean getArticleView(int num)throws Exception{
			
		            BoardDataBean data = getArticle(num);
					String str = data.getContent();
					str = str.replaceAll("\n", "<br>");
					str = str.replaceAll("\r", "") ;
					data.setContent(str);
					
					Connection con = getConnection();
					String sql = "update board set readcount=readcount+1 where num=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setInt(1, num);
					ps.executeUpdate();
					ps.close();
					con.close();
					
					return data;
		}
		
		public List<BoardDataBean> getArticles()  throws Exception{
			Connection conn = getConnection() ;
			String sql = "select * from board order by ref desc, re_step asc " ;
			PreparedStatement ps = conn.prepareStatement(sql) ;
			ResultSet rs = ps.executeQuery() ;
			List<BoardDataBean> list = new ArrayList<BoardDataBean>() ;
			while(rs.next()) {
				BoardDataBean item = new BoardDataBean() ;
				item.setNum(rs.getInt("num"));
				item.setWriter(rs.getString("writer"));
				item.setEmail(rs.getString("email"));
				item.setSubject(rs.getString("subject"));
				item.setSubject(rs.getString("passwd"));
				item.setContent(rs.getString("content"));
				item.setIp(rs.getString("ip"));
				item.setReg_date(rs.getTimestamp("reg_date"));
				item.setReadcount(rs.getInt("readcount"));
				item.setRe_step(rs.getInt("re_step"));
				item.setRe_level(rs.getInt("re_level"));
				item.setRef(rs.getInt("ref"));
				list.add(item) ;
			}
			rs.close();
			ps.close();
			conn.close();
			return list ;	
		}
		public List<BoardDataBean> getArticles(int first, int size)  throws Exception{
			Connection conn = getConnection() ;
			String sql = "select * from board order by ref desc, re_step asc limit ?, ?" ;
			PreparedStatement ps = conn.prepareStatement(sql) ;
			ps.setInt(1,  first);
			ps.setInt(2, size);
			ResultSet rs = ps.executeQuery() ;
			List<BoardDataBean> list = new ArrayList<BoardDataBean>() ;
			while(rs.next()) {
				BoardDataBean item = new BoardDataBean() ;
				item.setNum(rs.getInt("num"));
				item.setWriter(rs.getString("writer"));
				item.setEmail(rs.getString("email"));
				item.setSubject(rs.getString("subject"));
				item.setContent(rs.getString("content"));
				item.setIp(rs.getString("ip"));
				item.setReg_date(rs.getTimestamp("reg_date"));
				item.setReadcount(rs.getInt("readcount"));
				item.setRe_step(rs.getInt("re_step"));
				item.setRe_level(rs.getInt("re_level"));
				item.setRef(rs.getInt("ref"));
				list.add(item) ;
			}
			rs.close();
			ps.close();
			conn.close();
			return list ;	
		}
		
		public int getArticleCount() throws Exception {
			int result = 0 ;
			Connection conn = getConnection() ;
			String sql = "select count(*) as num from board"  ;
			PreparedStatement ps = conn.prepareStatement(sql) ;
			ResultSet rs = ps.executeQuery() ;
			if(rs.next()) result = rs.getInt("num") ; 
			rs.close();
			ps.close();
			conn.close();

			return result ;
		}
		
		

		

	}


