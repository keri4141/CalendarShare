package aot.CalendarWeb.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.DaoMVC;

/**
 * Servlet implementation class ViewSharedCalendarsServlet
 */
@WebServlet("/ViewSharedCalendarsServlet")
public class ViewSharedCalendarsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		String id_usershared=(String) session.getAttribute("id_usershared");
		String sql = "SELECT * FROM Calendar WHERE id_user="+id_usershared;
		ResultSet rs=DaoMVC.RetrieveCalendar(sql);
		

       
        response.setCharacterEncoding("utf8");
        response.setContentType("application/json"); 
        PrintWriter out = response.getWriter(); 
           
       /* JSONObject obj = new JSONObject();
        try {
			obj.put("events",convertToJSON(rs));
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       */
        JSONArray s;
		try {
			s = convertToJSON(rs);
			 out.print(s);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        //String json = new Gson().toJson(obj);
        //json = "[" + json + "]";
        //response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id_usershared = request.getParameter("id_usershared");
		String sql = "SELECT * FROM Calendar WHERE id_user="+id_usershared;
		ResultSet rs=DaoMVC.RetrieveCalendar(sql);
		

       
        response.setCharacterEncoding("utf8");
        response.setContentType("application/json"); 
        PrintWriter out = response.getWriter(); 
           
       /* JSONObject obj = new JSONObject();
        try {
			obj.put("events",convertToJSON(rs));
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       */
        JSONArray s;
		try {
			s = convertToJSON(rs);
			 out.print(s);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
        //String json = new Gson().toJson(obj);
        //json = "[" + json + "]";
        //response.getWriter().write(json);
	}
	
	public static JSONArray convertToJSON(ResultSet resultSet)
            throws Exception {
        JSONArray jsonArray = new JSONArray();
        while (resultSet.next()) {
            int total_rows = resultSet.getMetaData().getColumnCount();
            JSONObject obj = new JSONObject();
            for (int i = 0; i < total_rows; i++) {
                obj.put(resultSet.getMetaData().getColumnLabel(i + 1)
                        .toLowerCase(), resultSet.getObject(i + 1));
                
                
                               
            }
            jsonArray.put(obj);
        }
        return jsonArray;
    }

}
