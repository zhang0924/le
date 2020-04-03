package web.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/existServlet")
public class existServlet extends HttpServlet  {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object userroot = session.getAttribute("useroot");
        System.out.println(userroot);
        session.removeAttribute("useroot");
        System.out.println(userroot);
        response.sendRedirect(request.getContextPath()+"/admin/adminLogin.jsp");

        }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request, response);
        }


}
