package Diamond;

import Database.Database;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class purchase extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = (HttpSession) request.getSession(false);
        String[] cart = (String[]) session.getAttribute("cart");

        Database db = new Database();
        db.connect();

        String companyId = (String) session.getAttribute("companyId");
        try {
            db.stmt = db.con.createStatement();
            for (String report_no : cart) {
                String query = "UPDATE `buyer_list` SET `is_sold`=1,`buyer_id`='" + companyId + "' WHERE `report_no`=" + report_no;
                db.stmt.executeUpdate(query);
            }
        } catch (Exception error) {
            out.println(error);
        } finally {
            db.close();
        }
        
        session.setAttribute("cart", new String[0]);
        request.setAttribute("confiramtion", "Your Order will Diliver soon..., Thank you, Visit again");

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

}
