package geasipan;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class geasipanwrite 
{
		private Connection conn; 
		private ResultSet rs;

		public geasipanwrite() 
		{
			try {
				String url = "jdbc:mysql://localhost:3306/1pmmidia?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			    String id = "root";
			    String pwd = "7891";
			    
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, id, pwd);
				
			} catch (Exception e) 
			{
				e.printStackTrace(); 
			}
		}

		
		public String getDate() 
		{ 
			String SQL = "SELECT NOW()";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
			} catch (Exception e)
			{
				e.printStackTrace();
			}
			return ""; 
		}

			public int getNext()
			{ 
				String SQL = "SELECT number FROM 1pmmidia.boardwrite ORDER BY number DESC";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					rs = pstmt.executeQuery();
					
					if(rs.next()) 
					{
						return rs.getInt(1) + 1;
					}
					return 1;
				} catch (Exception e) 
				{
					e.printStackTrace();
				}
				return -1; 
			}

			public int write(String title, String userID, String userTel, String content) 
			{ 
				String SQL = "INSERT INTO 1pmmidia.boardwrite VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, getNext());
					pstmt.setString(2, title);
					pstmt.setString(3, userID);
					pstmt.setString(4, userTel);
					pstmt.setString(5, getDate());
					pstmt.setString(6, content);
					pstmt.setInt(7, 0);
					pstmt.setInt(8, 0);
					
					return pstmt.executeUpdate();
				} catch (Exception e) 
				{
					e.printStackTrace();
				}
				return -1; //데이터베이스 오류
			}
	}
