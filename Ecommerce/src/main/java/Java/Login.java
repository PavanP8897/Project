package Java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    public Login() {
        super();
    }

    Connection con;
    public void init(ServletConfig config) throws ServletException {
        try {
            Class.forName("org.h2.Driver");
            con = DriverManager.getConnection("jdbc:h2:~/test", "Pavan", "Pavan");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
        try {
            con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            String password = request.getParameter("pwd");
            PreparedStatement ps = con.prepareStatement("select * from REGISTER where name=? and password=?");
            ps.setString(1, name);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            PrintWriter pw = response.getWriter();
            
            if(rs.next()) {
                String user = rs.getString("Name");
                HttpSession session = request.getSession();
                session.setAttribute("user", user);  // Store user information in session
                System.out.println("User stored in session: " + user);  // Debugging line
                response.sendRedirect("Options.jsp");
            } else {
                pw.println("<html><body><script>");
                pw.println("alert(\"Invalid Name/Password\");");
                pw.println("window.location.href = \"Login.html\";");
                pw.println("</script></body></html>");
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
