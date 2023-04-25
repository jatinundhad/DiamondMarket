package Database;

import java.sql.*;

public class Database {

    public Connection con;
    public Statement stmt;
    public PreparedStatement pStmt;
    public CallableStatement cStmt;

    public Database() {
        con = null;
        stmt = null;
    }

    public void connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dm", "root", "");
            stmt = con.createStatement();
        } catch (Exception e) {
            System.out.println("Exception/Error: " + e);
        }
    }

    public void close() {
        try {
            con.close();
        } catch (Exception e) {
            System.out.println("Exception/Error: " + e);
        }
    }
}
