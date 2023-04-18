package AuthenticationServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
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

        String apiUrl = "https://commonapi.mastersindia.co/commonapis/searchgstin?gstin="+request.getParameter("gstno");
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Authorization","Bearer 0ab31ef7392227173c6e8d34195e86d5eb0da1e9");
        conn.setRequestProperty("client_id", "JarZChUcsytSBbnkpt");
        conn.connect();

        // Read the response from the API
        int responseCode = conn.getResponseCode();
        String responseBody = "";
        if (responseCode == HttpURLConnection.HTTP_OK) {
            Scanner scanner = new Scanner(conn.getInputStream());
            while (scanner.hasNextLine()) {
                responseBody += scanner.nextLine();
            }
            scanner.close();
        }

        // Set the response content type and write the response body to the output stream
        response.setContentType("application/json");
        out.println("<p>"+ responseBody +"</p>");
        out.println("<h1>GST Number :" + request.getParameter("gstno") + "</h1>");
        out.println("<h1>Comapny Name :" + request.getParameter("companyname") + "</h1>");
        out.println("<h1>Email ID : " + request.getParameter("email") + "</h1>");
        out.println("<h1>Contact Info: " + request.getParameter("contact") + "</h1>");
        out.println("<h1>GST Number : " + request.getParameter("password") + "</h1>");

    }

}
