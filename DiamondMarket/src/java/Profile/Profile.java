
package Profile;

import Database.Database;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Profile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Profile/profile.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        String reportNo = request.getParameter("reportNo");
        String query = "DELETE FROM `buyer_list` WHERE `report_no`="+reportNo;
        
        Database db = new Database();
        db.connect();
        
        try{
            db.stmt = db.con.createStatement();
            db.stmt.executeUpdate(query);
        }catch(Exception error){
            out.print(error);
        }finally{
            db.close();
        }
        
        request.setAttribute("removeSell", "Diamond Listing has been removed successfully");
        request.getRequestDispatcher("Profile/profile.jsp").forward(request, response);
    }

}
