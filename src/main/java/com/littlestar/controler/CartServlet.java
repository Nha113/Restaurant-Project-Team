package com.littlestar.controler;

import com.littlestar.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String CART_KEY = "cart";

    private static final Map<String, BigDecimal> MENU_PRICES = new HashMap<>();

    static {

        MENU_PRICES.put("Spicy Chicken Sandwich", new BigDecimal("8.99"));
        MENU_PRICES.put("Crispy Fried Chicken", new BigDecimal("9.50"));
        MENU_PRICES.put("Garlic Bread Sticks", new BigDecimal("5.00"));
        MENU_PRICES.put("Fresh Mango Lassi", new BigDecimal("4.50"));
        MENU_PRICES.put("Pasta Dish", new BigDecimal("12.50"));
        MENU_PRICES.put("Matcha Strawberry", new BigDecimal("7.50"));
        MENU_PRICES.put("Noodle Soup", new BigDecimal("5.00"));
        MENU_PRICES.put("Grilled Beef Steak", new BigDecimal("5.00"));

        // Add your other menu items here if needed
        MENU_PRICES.put("Salted Fried Egg", new BigDecimal("25.00"));
        MENU_PRICES.put("Salted Fried Chicken", new BigDecimal("20.00"));
        MENU_PRICES.put("Lotus Fish Wind", new BigDecimal("19.00"));
        MENU_PRICES.put("Salted Bread Hotdog", new BigDecimal("27.00"));
        MENU_PRICES.put("Italian Sauce Mushroom", new BigDecimal("19.00"));
    }

    @SuppressWarnings("unchecked")
    private List<CartItem> getCart(HttpSession session) {

        List<CartItem> cart =
                (List<CartItem>) session.getAttribute(CART_KEY);

        if (cart == null) {

            cart = new ArrayList<>();

            session.setAttribute(CART_KEY, cart);
        }

        return cart;
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(true);

        List<CartItem> cart = getCart(session);

        sendJson(response, cart);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(true);

        List<CartItem> cart = getCart(session);

        String action = request.getParameter("action");

        // =========================
        // ADD
        // =========================
        if ("add".equals(action)) {

            String name = request.getParameter("name");
            String priceStr = request.getParameter("price");

            if (name == null || name.isBlank()) {

                response.setStatus(
                        HttpServletResponse.SC_BAD_REQUEST);

                sendMessage(response, "Invalid item.");

                return;
            }

            BigDecimal price = MENU_PRICES.get(name);

            if (price == null) {

                try {

                    price = new BigDecimal(priceStr);

                } catch (Exception e) {

                    response.setStatus(
                            HttpServletResponse.SC_BAD_REQUEST);

                    sendMessage(response, "Invalid price.");

                    return;
                }
            }

            CartItem existing = findItem(cart, name);

            if (existing != null) {

                existing.setQuantity(
                        existing.getQuantity() + 1
                );

            } else {

                cart.add(
                        new CartItem(name, price, 1)
                );
            }
        }

        // =========================
        // UPDATE
        // =========================
        else if ("update".equals(action)) {

            int index = parseInt(
                    request.getParameter("index"),
                    -1
            );

            int quantity = parseInt(
                    request.getParameter("quantity"),
                    0
            );

            if (index < 0 || index >= cart.size()) {

                response.setStatus(
                        HttpServletResponse.SC_BAD_REQUEST
                );

                sendMessage(response, "Invalid cart item.");

                return;
            }

            if (quantity <= 0) {

                cart.remove(index);

            } else {

                cart.get(index).setQuantity(quantity);
            }
        }

        // =========================
        // REMOVE
        // =========================
        else if ("remove".equals(action)) {

            int index = parseInt(
                    request.getParameter("index"),
                    -1
            );

            if (index >= 0 && index < cart.size()) {

                cart.remove(index);
            }
        }

        // =========================
        // CLEAR
        // =========================
        else if ("clear".equals(action)) {

            cart.clear();
        }

        else {

            response.setStatus(
                    HttpServletResponse.SC_BAD_REQUEST
            );

            sendMessage(response, "Unknown cart action.");

            return;
        }

        session.setAttribute(CART_KEY, cart);

        sendJson(response, cart);
    }

    private CartItem findItem(
            List<CartItem> cart,
            String name) {

        for (CartItem item : cart) {

            if (item.getName().equals(name)) {

                return item;
            }
        }

        return null;
    }

    private int parseInt(
            String value,
            int fallback) {

        try {

            return Integer.parseInt(value);

        } catch (Exception e) {

            return fallback;
        }
    }

    private void sendMessage(
            HttpServletResponse response,
            String message)
            throws IOException {

        response.setContentType(
                "application/json;charset=UTF-8");

        response.setCharacterEncoding("UTF-8");

        response.getWriter().write(
                "{\"message\":\""
                        + escapeJson(message)
                        + "\"}"
        );
    }

    private void sendJson(
            HttpServletResponse response,
            List<CartItem> cart)
            throws IOException {

        response.setContentType(
                "application/json;charset=UTF-8");

        response.setCharacterEncoding("UTF-8");

        int count = 0;

        BigDecimal total = BigDecimal.ZERO;

        StringBuilder json =
                new StringBuilder("{\"items\":[");

        for (int i = 0; i < cart.size(); i++) {

            CartItem item = cart.get(i);

            int quantity = item.getQuantity();

            BigDecimal price =
                    item.getPrice() != null
                            ? item.getPrice()
                            : BigDecimal.ZERO;

            BigDecimal subtotal =
                    price.multiply(
                            BigDecimal.valueOf(quantity)
                    );

            count += quantity;

            total = total.add(subtotal);

            if (i > 0) {
                json.append(",");
            }

            json.append("{\"name\":\"")
                    .append(escapeJson(item.getName()))
                    .append("\",\"price\":")
                    .append(price.toPlainString())
                    .append(",\"quantity\":")
                    .append(quantity)
                    .append(",\"subtotal\":")
                    .append(subtotal.toPlainString())
                    .append("}");
        }

        json.append("],\"count\":")
                .append(count)
                .append(",\"total\":")
                .append(total.toPlainString())
                .append("}");

        response.getWriter().write(
                json.toString()
        );
    }

    private String escapeJson(String value) {

        if (value == null) {
            return "";
        }

        return value
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\r", "\\r")
                .replace("\n", "\\n");
    }
}