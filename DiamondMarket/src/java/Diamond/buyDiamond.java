package Diamond;

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

public class buyDiamond extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Database db = new Database();

        try {
            db.connect();                 
            db.stmt = db.con.createStatement();

            HttpSession session = request.getSession(false);

            String CompanyId = (String) session.getAttribute("companyId");
            String query = "select * from `buyer_list` where `company_id`='" + CompanyId + "' and `is_sold`=0";
            ResultSet rs = db.stmt.executeQuery(query);

            Vector<Diamond> data = new Vector<>();

            while (rs.next())   {
                Diamond dm = new Diamond(rs);
                data.add(dm);
            }

            request.setAttribute("data", data);
        } catch (Exception error) {
            out.println(error);
        }

        request.getRequestDispatcher("/Diamond/buyDiamond.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
