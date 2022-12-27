package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Dto.MemberDto;
import Dto.SalesDto;

public class SalesDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public SalesDao() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	// SELECTALL
	public List<SalesDto> SelectAll() {
		List<SalesDto> list = new ArrayList();
		SalesDto dto=null;
		try {
			String sql="select mem.custno,custname,grade, sum(price) as sales "
					+ "from member_tbl_02 mem "
					+ "inner join money_tbl_02 money "
					+ "on mem.custno = money.custno "
					+ "group by mem.custno,custname,grade "
					+ "order by sum(price) desc";
			
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs!=null)
			{
				while(rs.next())
				{
					dto = new SalesDto();
					dto.setCustno(rs.getInt("custno")+"");
					dto.setCustname(rs.getString("custname"));
					dto.setGrade(rs.getString("grade"));
					dto.setSales(rs.getInt("sales")+"");	
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
