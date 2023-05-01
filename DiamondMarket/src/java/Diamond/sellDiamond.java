package Diamond;

import Database.Database;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class sellDiamond extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Diamond/sellDiamondForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        
        
        String companyId = (String)session.getAttribute("companyId");
        String color = request.getParameter("color");
        String purity = request.getParameter("purity");
        String cut = request.getParameter("cut");
        double weight = Double.parseDouble(request.getParameter("weight"));
        double depther = Double.parseDouble(request.getParameter("depther"));
        double table = Double.parseDouble(request.getParameter("table"));
        int totalPrice = extractInt(request.getParameter("totalPrice"));
        int ppCarat = Integer.parseInt(request.getParameter("pricePerCarat"));
        int totalRapPrice = extractInt(request.getParameter("totalRapPrice"));
        int rapPricePerCarat = Integer.parseInt(request.getParameter("rapPricePerCarat"));
        String certAuth = request.getParameter("certAuth");
        int isSold = 0;

        Database db = new Database();
        db.connect();

        try {
            String query = "INSERT INTO `buyer_list` (`company_id`, `color`, `purity`, `cut`, `weight`, `depther`, `table`, `price_cts`, `total`, `rap_price_carat`, `rap_total`, `cert`, `is_sold`) VALUES ('" + companyId + "','" + color + "','" + purity + "','" + cut + "','" + weight + "','" + depther + "','" + table + "','" + ppCarat + "','" + totalPrice + "','" + rapPricePerCarat + "','" + totalRapPrice + "','" + certAuth + "','" + isSold + "')";
            db.stmt = db.con.createStatement();
            db.stmt.executeUpdate(query);
            
            request.setAttribute("sellItemAdded", "Your Diamond is on sell Now!!!");
            request.getRequestDispatcher("/Diamond/sellDiamondForm.jsp").forward(request, response);
            
        } catch (Exception error) {
            out.print(error);
        }finally{
            db.close();
        }
                
        
    }
    
    
    static int extractInt(String str)
    { 
        return Integer.parseInt(str.replaceAll("[^0-9]", ""));
    }

}
