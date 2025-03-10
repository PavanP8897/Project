package Java;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class CartSe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

        String action = request.getParameter("action");
        String productName = request.getParameter("product_name");

        if (action != null && cart != null) {
            if (action.equals("increment")) {
                for (Map<String, Object> product : cart) {
                    if (productName.equals(product.get("Product_Name"))) {
                        product.put("Quantity", (int) product.get("Quantity") + 1);
                        break;
                    }
                }
            } else if (action.equals("decrement")) {
                for (Map<String, Object> product : cart) {
                    if (productName.equals(product.get("Product_Name"))) {
                        int quantity = (int) product.get("Quantity");
                        if (quantity > 1) {
                            product.put("Quantity", quantity - 1);
                        }
                        break;
                    }
                }
            } else if (action.equals("remove")) {
                cart.removeIf(product -> productName.equals(product.get("Product_Name")));
            } else if (action.equals("buy")) {
                session.setAttribute("orders", cart);
                cart.clear();
                response.sendRedirect("Order.jsp");
                return;
            }
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("Cart.jsp");
    }
}
