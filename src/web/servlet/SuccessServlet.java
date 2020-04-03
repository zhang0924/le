package web.servlet;

import domain.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/successServlet")
public class SuccessServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取request域中共享的user对象
        User user = (User) request.getAttribute("user");
        if (user != null) {
            //转发到成功登录的过渡界面
            int id = user.getId();
            String username = user.getUsername();
            String password = user.getPassword();
            String email = user.getEmail();
            String datetime = user.getDatetime();
            request.setCharacterEncoding("utf-8");
            request.setAttribute("id", id);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.setAttribute("datetime", datetime);
            request.getRequestDispatcher("./htmls/successLogin.jsp").forward(request, response);


        }else{
            System.out.println(user);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
