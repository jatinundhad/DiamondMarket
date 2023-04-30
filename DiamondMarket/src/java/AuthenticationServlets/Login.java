package AuthenticationServlets;

import Database.Database;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Authentication/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String CompanyId = request.getParameter("companyId").trim();
        String Password = request.getParameter("password").trim();
        


        Database db = new Database();
        db.connect();

        try {
            String query = "select * from user_credentials where company_id=? and password=?";
            db.pStmt = db.con.prepareStatement(query);

            db.pStmt.setString(1, CompanyId);
            db.pStmt.setString(2, Password);

            ResultSet rs = db.pStmt.executeQuery();
            
            if (rs.next()) {
                HttpSession session = request.getSession(true);
                session.setAttribute("companyId", CompanyId);
                session.setAttribute("loggedIn", true);
                session.setAttribute("cart", new String[0]);

                request.getRequestDispatcher("index.jsp").forward(request, response);
                
            } else {
                    
                request.setAttribute("alert", "User Not Exist.");
                request.getRequestDispatcher("Authentication/Login.jsp").forward(request, response);
            }

        } catch (Exception error) {
            out.println(error);
        }
    }

}
