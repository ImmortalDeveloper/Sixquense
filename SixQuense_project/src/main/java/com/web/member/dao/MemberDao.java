package com.web.member.dao;

import static com.web.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.web.common.JDBCTemplate;
import com.web.member.dto.Member;
public class MemberDao {
	private Properties sql=new Properties();
	
	{
		String path=MemberDao.class.getResource("/sql/member/member_sql.properties").getPath();
		try(FileReader fr=new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	public List<Member> selectMemberAll(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM MEMBER";
		List<Member> result=new ArrayList<>();
		try{
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Member m=getMember(rs);
				result.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
		}return result;
	}

	public Member selectMemberByEmailAndPw(Connection conn, String userId, String userpw) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberByIdAndPw"));
			pstmt.setString(1, userId);
			pstmt.setString(2, userpw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	private Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
				.userNo(rs.getInt("member_no"))
				.userId(rs.getString("user_id"))
				.userPw(rs.getString("user_pw"))
				.phone(rs.getString("phone"))
				.KruserName(rs.getString("KR_USER_NAME"))
				.userDd(rs.getDate("user_dd"))	
				.enrollData(rs.getDate("ENROLL_DATE"))
				.userIntroduce(rs.getString("user_introduce"))
				.travleType(rs.getString("travle_type"))
				.gender(rs.getString("gender"))
				.notificatIonset(rs.getString("notificationset"))
				.originalFilename(rs.getString("PROFILE_ORI_FILNAME"))
				.renameFilename(rs.getString("PROFILE_RE_FILNAME"))
				.build();
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		System.out.println(m);
		try {
			pstmt=conn.prepareStatement(sql.getProperty("lnsertMember"));
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPw());
			pstmt.setString(3, m.getPhone());
			pstmt.setDate(4,m.getUserDd());
			/* pstmt.setString(5, m.getUserIntroduce()); */
			pstmt.setString(5, m.getTravleType());
			pstmt.setString(6, m.getGender());
			pstmt.setString(7, m.getNotificatIonset());
			/*
			 * pstmt.setString(9, m.getOriginalFilename()); pstmt.setString(10,
			 * m.getRenameFilename());
			 */
			pstmt.setString(8, m.getKruserName());
			result=pstmt.executeUpdate();			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	
	public Member selectMemberByEmailAndName(Connection conn, String email, String name) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberByEmailAndName"));
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			rs=pstmt.executeQuery();
			if(rs.next()) m=getMember(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
		
	}
	public int updatePassword(Connection conn, String userId, String pw) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updatePassword"));
			pstmt.setString(1, pw);
			pstmt.setString(2, userId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
}
