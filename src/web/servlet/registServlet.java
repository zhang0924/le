package web.servlet;

import dao.impl.UserDao;
import domain.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/registServlet")
public class registServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String checkCode = req.getParameter("code");
        //session中存储的验证码
        HttpSession session = req.getSession();
        String checkCode_session = (String) session.getAttribute("checkCode_session");
        //删除session中存储的验证码
        session.removeAttribute("checkCode_session");
        //日志中查看
        System.out.println("--注册页面session中的验证码" + checkCode_session);
        System.out.println("--注册页面用户输入的验证码：" + checkCode);
        System.out.println(req.getRemoteAddr() + "注册页面");
        //首先判断验证码是否正确
        if (checkCode_session != null && checkCode_session.equalsIgnoreCase(checkCode)) {
            UserDao userDao = new UserDao();
            if (userDao.queryUser(username) != null) {
                req.setAttribute("regist_error", "用户名 " + username + " 已被注册！");
                //转发到注册页面
                req.getRequestDispatcher("./htmls/register.jsp").forward(req, resp);
            } else {
                //把用户信息保存到数据库
                userDao.saveUser(new User(username, password, email));
                //转发到注册成功后的页面
                req.setCharacterEncoding("utf-8");
                req.setAttribute("username",username);
                req.setAttribute("success", "注册成功,请用此用户名登录: ");
                req.getRequestDispatcher("./htmls/gou.jsp").forward(req, resp);
            }
        } else {
            //验证码不一致
            //存储提示信息到request
            req.setAttribute("regist_error", "验证码错误！");
            //转发到注册页面
            req.getRequestDispatcher("./htmls/register.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
