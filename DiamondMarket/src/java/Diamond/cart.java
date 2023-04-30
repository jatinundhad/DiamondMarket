package Diamond;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class cart extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/Diamond/cart.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String cartRemove = request.getParameter("reportNo");
//        out.println(cartRemove);
        HttpSession session = request.getSession(false);
        String[] cart = (String[])session.getAttribute("cart");
//                out.println(cart);

        String[] temp = new String[cart.length-1];
//                out.println(temp);

        int i  = 0;
        for (String item : cart) {
            if (!item.equals(cartRemove)) {
                temp[i] = item;
                i++;
            }
        }
        
        session.setAttribute("cart", temp);
        request.getRequestDispatcher("/Diamond/cart.jsp").forward(request, response);
    }

}
