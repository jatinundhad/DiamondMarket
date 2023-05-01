package AuthenticationServlets;

import Database.Database;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        // inserting all the information into database
        Database db = new Database();

        db.connect();

        String companyId = request.getParameter("companyId").trim();
        String companyName = request.getParameter("companyName").trim();
        String email = request.getParameter("email").trim();
        String contact = request.getParameter("contact").trim();
        String password = request.getParameter("password").trim();
        
        

        String query = "INSERT INTO `user_credentials` VALUES('" + companyId + "','" + companyName + "','" + password + "','" + email + "','" + contact + "')";

        try {
            db.stmt = db.con.createStatement();
            db.stmt.executeUpdate(query);

            // doing login just after registering
            HttpSession session = request.getSession(true);
            session.setAttribute("companyId", companyId);
            session.setAttribute("loggedIn", true);
            session.setAttribute("cart", new String[0]);
        } catch (Exception e) {
            request.setAttribute("alert", "Company ID already exist");
            request.getRequestDispatcher("/Authentication/Register.jsp").forward(request, response);
            return;
        }

        db.close();

        response.setContentType("text/html");
        response.sendRedirect("/DiamondMarket");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Authentication/Register.jsp").forward(request, response);
    }
}
