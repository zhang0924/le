package web.servlet;


import dao.BlogDao;
import domain.user.Blog;
import domain.user.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateBlogServlet")
public class updateBlogServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取id
        String id = request.getParameter("id");
        BlogDao dao = new BlogDao();
        Blog blog = dao.updateBlog(Integer.parseInt(id));

        //3.将user存入request
        request.setAttribute("blog",blog);
        //4.转发到update.jsp
        request.getRequestDispatcher("/admin/updateBlog.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
