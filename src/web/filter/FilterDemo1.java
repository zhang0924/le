package web.filter;

import com.alibaba.druid.sql.visitor.functions.If;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/*")
public class FilterDemo1 implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        String uri=request.getRequestURI();
        if (uri.contains("addBlogServlet")||uri.contains("/addUserServlet")||uri.contains("/delSelectedServlet")||uri.contains("/delUserServlet")||uri.contains("/findUserByPageServlet")||uri.contains("/findUserServlet")||uri.contains("/updateUserServlet")||uri.contains("/userListServlet")||uri.contains("/delBlogsServlet")||uri.contains("/delBlogServlet")||uri.contains("/findBlogsByPageServlet")||uri.contains("/updateBlogServlet")||uri.contains("/xiugaiBlogServlet")){
            Object user =request.getSession().getAttribute("useroot");
            if (user!=null){
                filterChain.doFilter(request,servletResponse);
            }else {
                request.setAttribute("login_msg","你尚未登录,请登录");
                request.getRequestDispatcher("/admin/adminLogin.jsp").forward(servletRequest,servletResponse);
            }
        }else {
            filterChain.doFilter(servletRequest,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
