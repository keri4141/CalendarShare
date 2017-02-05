package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import model.ModelMVC;
public class DaoMVC {

	//Registers the user into the database
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
	
	//Checks if a username is taken or not
	public static boolean usernameCheck(String sql,String username)
	{
		boolean userExistance=false;
		ResultSet rs = null;
		int count=0;
		
		Connection conn=connect();
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, username);
			
			rs=ps.executeQuery();
			
		while(rs.next())
		{	
			
			count++; //counts how many rows exist in the database
		}
		if(count>0) 
		{
			userExistance=true;
		}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		return userExistance;
		
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

	//updates the user's calendar
	public static void UpdateCalendar(String sql,String param1,String param2,String param3,String param4)
	{
		Connection conn=connect();
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,param1);
			ps.setString(2,param2);
			ps.setString(3,param3);
			ps.setString(4,param4);
			ps.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//Retrieve's a users calendar
	public static ResultSet RetrieveCalendar(String sql)
	{
		ResultSet rs = null;
		
		Connection conn=connect();
		try {
			PreparedStatement ps= conn.prepareStatement(sql);
			
			
			rs=ps.executeQuery();
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return rs;
		
		
	}
	
	//Login 
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

	//updates the share Table after a user shares a calendar with another user
	public static void Share(String sql,String param1, String param2) {
		Connection conn=connect();
		try {
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,param1);
			ps.setString(2,param2);
			
			ps.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
//Remove an event from database
	public static void DeleteEvent(String sql, String id) {
		Connection conn=connect();
		
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,id);
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	//after moving an event the database will update according to the date on event
	public static void moveUpdateCalendar(String sql, String title,
											String start, String end, String id) {
Connection conn=connect();
		
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,title);
			ps.setString(2,start);
			ps.setString(3,end);
			ps.setString(4,id);
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		
		
		
	
	
}
