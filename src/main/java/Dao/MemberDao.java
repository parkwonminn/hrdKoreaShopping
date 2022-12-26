package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Dto.MemberDto;

public class MemberDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public MemberDao() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// INSERT
	public boolean Insert(MemberDto dto) {
		boolean isok = false;
		try {
			pstmt = con.prepareStatement("insert into member_tbl_02 values(?,?,?,?,?,?,?)");
			pstmt.setInt(1, Integer.parseInt(dto.getCustno()));
			pstmt.setString(2, dto.getCustname());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getJoindate());
			pstmt.setString(6, dto.getGrade());
			pstmt.setString(7, dto.getCity());
			int result = pstmt.executeUpdate();
			if (result > 0)
				isok = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception e) {}
			try {con.close();} catch (Exception e) {}
		}
		return isok;

	}

	public int maxcustno() {
		int result=0;
		try {
			pstmt = con.prepareStatement("select max(custno) from member_tbl_02");
			rs = pstmt.executeQuery();
			if(rs !=null)
			{
				rs.next();
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {pstmt.close();} catch (Exception e) {}
			try {con.close();} catch (Exception e) {}
		}
		
		return result;
	}

	
	// UPDATE
	public void Update(MemberDto dto) {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	}

	// SELECT
	public void Select(MemberDto dto) {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	}

	// SELECTALL
	public List<MemberDto> SelectAll() {
		List<MemberDto> list = new ArrayList();
		MemberDto dto=null;
		try {
			pstmt = con.prepareStatement("select * from member_tbl_02");
			rs=pstmt.executeQuery();
			if(rs!=null)
			{
				while(rs.next())
				{
					dto = new MemberDto();
					dto.setCustno(rs.getInt("custno")+"");
					dto.setCustname(rs.getString("custname"));
					dto.setPhone(rs.getString("phone"));
					dto.setAddress(rs.getString("address"));
					dto.setJoindate(rs.getString("joindate"));
					dto.setGrade(rs.getString("grade"));
					dto.setCity(rs.getString("city"));
					list.add(dto);
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {pstmt.close();} catch (Exception e) {}
			try {con.close();} catch (Exception e) {}
		}
		return list;
	}
}
