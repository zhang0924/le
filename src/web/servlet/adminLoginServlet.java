package web.servlet;


import dao.impl.UserDao;
import domain.user.Useroot;
import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/adminLoginServlet")
public class adminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取数据
        //2.1获取用户填写验证码
        String verifycode = request.getParameter("code");

        //3.验证码校验
        HttpSession session = request.getSession();
        String checkCode_session = (String) session.getAttribute("checkCode_session");
        session.removeAttribute("checkCode_session");//确保验证码一次性


        if(checkCode_session!=null&&checkCode_session.equalsIgnoreCase(verifycode)){

            Map<String, String[]> map = request.getParameterMap();
            //4.封装User对象
            Useroot useroot = new Useroot();
            try {
                BeanUtils.populate(useroot,map);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }


            //5.调用userdao查询
            UserDao dao = new UserDao();
            Useroot loginroot = dao.loginroot(useroot);
            //6.判断是否登录成功
            if(loginroot != null){
                //登录成功
                //将用户存入session
                session.setAttribute("useroot",loginroot);
                response.sendRedirect(request.getContextPath()+"/findBlogsByPageServlet");
            }else{
                //登录失败
                //提示信息
                request.setAttribute("login_msg","用户名或密码错误！");
                //跳转登录页面
                request.getRequestDispatcher("./admin/adminLogin.jsp").forward(request,response);

            }

        }else {
            //验证码不正确
            //提示信息
            request.setAttribute("login_msg","验证码错误！");
            //跳转登录页面
            request.getRequestDispatcher("./admin/adminLogin.jsp").forward(request,response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
