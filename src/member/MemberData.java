package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class MemberData {
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

	public int insertMember(MemberInfo member) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO member VALUE(?,?,?,?,?,?)";
		int res=0;
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getNumb());
			pstmt.setString(5, member.getName());
			Timestamp ts = new Timestamp(System.currentTimeMillis());
			pstmt.setTimestamp(6, ts);
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return res;
	}
	
    public int updateMember(MemberInfo member, String id) {
        PreparedStatement pstmt = null;
        String query = "UPDATE member SET pass=?, name=?, email=? WHERE id=?";
        int res = 0;
        openConnection();
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, member.getPass());
            pstmt.setString(2, member.getName());
            pstmt.setString(3, member.getEmail());
            pstmt.setString(4, id);
            res = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return res;
    }
    
    public boolean isMember(String id, String pass) {
    	PreparedStatement pstmt = null;
    	String query = "SELECT * FROM member WHERE id=? and pass=?";
    	boolean res = false;
    	openConnection();
    	try {
    		pstmt = con.prepareStatement(query);
    		pstmt.setString(1, id);
    		pstmt.setString(2, pass);
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
    
    public int removeMember(String id) {
    	PreparedStatement pstmt=null;
    	String query = "DELETE FROM member WHERE id=?";
    	int res = 0;
    	openConnection();
    	try {
    		pstmt = con.prepareCall(query);
    		pstmt.setString(1, id);
    		res = pstmt.executeUpdate();
    	} catch (Exception e) {
    		e.printStackTrace();
    	} finally {
    		closeConnection();
    	}
    	return res;
    }
	
    public MemberInfo getMember(String id) {
        PreparedStatement pstmt = null;
        MemberInfo member = new MemberInfo();
        String query = "SELECT * FROM member WHERE id=?";
        openConnection();
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            member.setId(rs.getString("id"));
            member.setPass(rs.getString("pass"));
            member.setName(rs.getString("name"));
            member.setNumb(rs.getString("numb"));
            member.setEmail(rs.getString("email"));
            member.setDate(rs.getTimestamp("date"));
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return member;
    }
}

