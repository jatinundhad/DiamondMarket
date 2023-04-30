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

public class addToCart extends HttpServlet {
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        HttpSession session = request.getSession(false);
        String[] checkedRecords = request.getParameterValues("checkRecord[]");
        String[] cart = (String[]) session.getAttribute("cart");

        String[] finalCart;
        if (checkedRecords != null) {
            finalCart = new String[checkedRecords.length + cart.length];
        } else {
            finalCart = new String[cart.length];
        }

        int i = 0;
        for (String cartItem : cart) {
            finalCart[i] = cartItem;
            i++;
        }

        if (checkedRecords != null) {
            for (String checkRec : checkedRecords) {
                finalCart[i] = checkRec;
                i++;
            }
        }

        session.setAttribute("cart", finalCart);

        Database db = new Database();

        try {
            db.connect();
            db.stmt = db.con.createStatement();

            String CompanyId = (String) session.getAttribute("companyId");
            String query = "select * from `buyer_list` where `company_id`<>'" + CompanyId + "' and `is_sold`=0";
            ResultSet rs = db.stmt.executeQuery(query);

            Vector<Diamond> data = new Vector<>();

            while (rs.next()) {
                boolean flag = false;
                int repoNo = rs.getInt("report_no");
                for (i = 0; i < finalCart.length; i++) {
                    if (repoNo == Integer.parseInt(finalCart[i])) {
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    Diamond dm = new Diamond(rs);
                    data.add(dm);
                }
            }

            if (checkedRecords != null) {
                request.setAttribute("notification", "Your Diamond has been added to cart.");
            } else {
                request.setAttribute("notification", "Please choose diamonds to add in cart.");
            }

            request.setAttribute("data", data);
        } catch (Exception error) {
            out.println(error);
        }

        request.getRequestDispatcher("/Diamond/buyDiamond.jsp").forward(request, response);
    }
}
