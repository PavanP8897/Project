package Java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection con;

    public void init() {
        try {
            con = DriverManager.getConnection("jdbc:h2:~/test", "Pavan", "Pavan");
            Class.forName("org.h2.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
    	try {
            String name = request.getParameter("name");
            String password = request.getParameter("pwd");
            Double mobileNumber = Double.parseDouble(request.getParameter("num"));

            // Modified SQL query to include the ID column as placeholder
            PreparedStatement ps = con.prepareStatement("insert into REGISTER values(?,?,?)");
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setDouble(3, mobileNumber);
            ps.execute();

            RequestDispatcher rd = request.getRequestDispatcher("Register.html");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
        try {
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
