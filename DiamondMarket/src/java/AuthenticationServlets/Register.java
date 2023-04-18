package AuthenticationServlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<h1>GST Number :" + request.getParameter("gstno") + "</h1>");
        out.println("<h1>Comapny Name :" + request.getParameter("companyname")  + "</h1>");
        out.println("<h1>Email ID : " + request.getParameter("email")  + "</h1>");
        out.println("<h1>Contact Info: " + request.getParameter("contact")  + "</h1>");
        out.println("<h1>GST Number : " + request.getParameter("password")  + "</h1>");

    }

}
