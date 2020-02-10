package survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Dao {
	
	DataSource ds = null;
	Context init = null;
	
	public Dao() {
		try {
			init = (Context) new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/myOracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Vector<InfoDto> getResearchList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<InfoDto> memList = new Vector<InfoDto>();
		try {
			con = ds.getConnection();
			String sql = "select * from RESEARCH";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				InfoDto tmp = new InfoDto();
				tmp.setGender(rs.getString("gender"));
				tmp.setName(rs.getString("name"));
				tmp.setAge(rs.getString("age"));
				tmp.setInterest(rs.getString("interest"));
				tmp.setTime(rs.getTimestamp("time"));
				memList.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con != null) try {con.close();}catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();}catch(Exception e) {}
			if(rs != null) try {rs.close();}catch(Exception e) {}
		}
		return memList;
	}
	
}
