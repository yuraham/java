package post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;

public class DataManager {
	Connection con = null;
	String url="jdbc:mysql://localhost:3306/my_blog";
	String user="memo_user";
	String pass="gkadbfk12";
	
	private Connection openConnection() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	private void closeConnection() {
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con = null;
		}
	}

	
	public int insertPost(PostInfo post) {
		PreparedStatement pstmt=null;
		String query = "INSERT INTO post VALUES(?,?,?,?)";
		int res = 0;
		openConnection();
		try { 
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Types.NULL);
			pstmt.setString(2, post.getText());
			pstmt.setString(3, post.getWriter());
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			pstmt.setTimestamp(4, ts);
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return res;
	}
	
	public ArrayList<PostInfo> getList() {
		PreparedStatement pstmt = null;
		String query = "SELECT * FROM post ORDER BY numb DESC LIMIT 10";
		ArrayList<PostInfo> list = new ArrayList<PostInfo>();
		try {
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				PostInfo post = new PostInfo();
				post.setNumb(rs.getInt("numb"));
				post.setText(rs.getString("text"));
				post.setWriter(rs.getString("writer"));
				post.setCd_date(rs.getTimestamp("cd_date"));
				list.add(post);
			};
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean isPost(int numb) {
		PreparedStatement pstmt = null;
		String query = "SELECT * FROM post WHERE numb=?";
		boolean res = false;
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, numb);
			ResultSet rs = pstmt.executeQuery();
			res = rs.next();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return res;
	}
	
	
	public PostInfo getPost(int numb) { //numb이 null로 들어움
		PreparedStatement pstmt = null;
		PostInfo post = new PostInfo();
		String query = "SELECT * FROM post WHERE numb=?";
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt (1, numb);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			post.setNumb(rs.getInt("numb"));
			post.setText(rs.getString("text"));
			post.setWriter(rs.getString("writer"));
			post.setCd_date(rs.getTimestamp("cd_date"));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return post;
	}
	
/*	public int removePost(int numb) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM post WHERE numb=?";
		int res = 0;
		openConnection();
		try {
			pstmt = con.prepareCall(query);
			pstmt.setInt(1, numb);
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return res;
	}
	*/
	public int countPost() {
		PreparedStatement pstmt = null;
		String tatalSql = "SELECT COUNT(*) FROM post";
		int total = 0; 
		openConnection();
		try {
			pstmt = con.prepareStatement(tatalSql);
			ResultSet rs = pstmt.executeQuery();
		    if(rs.next()) {
		        total = rs.getInt(1);
		    }
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return total;
	}
}
