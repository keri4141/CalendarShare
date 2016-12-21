package aot.CalendarWeb.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;






import dao.DaoMVC;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session=request.getSession(); 
		String sql = "SELECT * FROM Calendar WHERE id_user="+session.getAttribute("idUsers");
		ResultSet rs=DaoMVC.RetrieveCalendar(sql);
		

       
        response.setCharacterEncoding("utf8");
        response.setContentType("application/json"); 
        PrintWriter out = response.getWriter(); 
           
     
        JSONArray s;
		try {
			s = convertToJSON(rs);
			 out.print(s);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		HttpSession session=request.getSession(); 
		
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String title = request.getParameter("title");
		String id = request.getParameter("eventid");
		String type=request.getParameter("type");
		
		
		//if the user moved an event
		if(type.equals("moveUpdate") || type.equals("resize"))
		{
			String sql = "UPDATE Calendar SET title=?,start=?,end=? WHERE id=?";
			
			DaoMVC.moveUpdateCalendar(sql,title,start,end,id);
			
		}
		
		
		//regular events loadup from DB
		else
		{
			
		
			String sql = "SELECT * FROM Calendar WHERE id_user="+session.getAttribute("idUsers");
			ResultSet rs=DaoMVC.RetrieveCalendar(sql);
			
	
	       
	        response.setCharacterEncoding("utf8");
	        response.setContentType("application/json"); 
	        PrintWriter out = response.getWriter(); 
	           
	     
	        JSONArray s;
			try {
				s = convertToJSON(rs);
				 out.print(s);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	}
	
	
	public static JSONArray convertToJSON(ResultSet resultSet)
            throws Exception {
        JSONArray jsonArray = new JSONArray();
        while (resultSet.next()) {
            int total_rows = resultSet.getRow();
            JSONObject obj = new JSONObject();
            for (int i = 0; i < 5; i++) {
                obj.put(resultSet.getMetaData().getColumnLabel(i + 1)
                        .toLowerCase(), resultSet.getObject(i + 1));
                
                
                               
            }
            jsonArray.put(obj);
        }
        return jsonArray;
    }

}
