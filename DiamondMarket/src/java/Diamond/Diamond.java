package Diamond;

import java.sql.ResultSet;

public class Diamond {

    public int reportNo;
    public String companyId;
    public String color;
    public String purity;
    public String cut;
    public double weight;
    public double depther;
    public double table;
    public int totalPrice;
    public int pricePerCarat;
    public int totalRapPrice;
    public int rapPricePerCarat;
    public String cert;

    public Diamond(ResultSet rs) {
        try {
            reportNo = rs.getInt("report_no");
            companyId = rs.getString("company_id");
            color = rs.getString("color");
            purity = rs.getString("purity");
            cut = rs.getString("cut");
            weight = rs.getDouble("weight");
            depther = rs.getDouble("depther");
            table = rs.getDouble("table");
            totalPrice = rs.getInt("total");
            pricePerCarat = rs.getInt("price_cts");
            totalRapPrice = rs.getInt("rap_total");
            rapPricePerCarat = rs.getInt("rap_price_carat");
            cert = rs.getString("cert");
        } catch (Exception error) {
            System.out.print(error);
        }
    }
}
