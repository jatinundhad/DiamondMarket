package AuthenticationServlets;

import Database.Database;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // inserting all the information into database
        Database db = new Database();

        db.connect();

        String companyId = request.getParameter("companyId").trim();
        String companyName = request.getParameter("companyName").trim();
        String email = request.getParameter("email").trim();
        String contact = request.getParameter("contact").trim();
        String password = request.getParameter("password").trim();

        String query = "INSERT INTO `user_credentials` VALUES('"+companyId+"','"+companyName+"','"+password+"','"+email+"','"+contact+"')";

        try {
            db.stmt = db.con.createStatement();
            db.stmt.executeUpdate(query);
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }

        db.close();
        
        response.setContentType("text/html");
        request.getRequestDispatcher("Login").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Authentication/Register.jsp").forward(request, response);
    }
}