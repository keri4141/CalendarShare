package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import model.ModelMVC;
public class DaoMVC {

	public static int registerUser(ModelMVC m, String sql)
	{
		int i =0;
		Connection conn=connect();
	try
	{
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1,m.getUsername());
		ps.setString(2,m.getPassword());
	
		i=ps.executeUpdate();
	} catch (SQLException e)
	{
		e.printStackTrace();
		
	}
		
	return i;
	}

	private static Connection connect() {
		Connection conn = null;
		
		
		 Properties connectionProps = new Properties();
		    connectionProps.put("user", "pokemonblastoise");
		    connectionProps.put("password", "johnspears2012");
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(
						"jdbc:mysql://johnspears.cipoex3flzaz.us-east-1.rds.amazonaws.com:3306/CalendarWeb", connectionProps);
			}catch(Exception e){}
			return conn;
		}

	public static ResultSet loginUser(ModelMVC m, String sql) {
		
		ResultSet rs = null;
		
		Connection conn=connect();
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1,m.getUsername());
			ps.setString(2,m.getPassword());
			
			rs=ps.executeQuery();
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return rs;
	}
		
		
		
	
	
}