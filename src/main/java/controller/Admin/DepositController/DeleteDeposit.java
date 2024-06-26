package controller.Admin.DepositController;

import dal.DepositDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteDepositServlet", value = "/dashboard/delete-deposit")
public class DeleteDeposit extends HttpServlet {
    private String message;
    private DepositDAO depositDAO;

    public void init() {
        message = "Hello World!";
        depositDAO = new DepositDAO();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (request.getParameter(("id")) != null) {
            String idStr = request.getParameter(("id"));
            HttpSession session=request.getSession();
            try {
                int id = Integer.parseInt(idStr);
                depositDAO.delete(id);
              session.setAttribute("success","Delete deposit successfully");
            } catch (Exception e) {
                session.setAttribute("error","Error while deleting deposit");
            }
            response.sendRedirect("/dashboard/deposits");
        } else {
            request.getRequestDispatcher("/404notfound/index.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}