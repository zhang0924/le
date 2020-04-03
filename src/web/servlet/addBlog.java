package web.servlet;

import dao.BlogDao;
import domain.user.Blog;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/addBlogServlet")
public class addBlog extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //2.获取数据
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String zy = request.getParameter("zy");
        String type = request.getParameter("type");
        String tag = request.getParameter("tag");
        String indexPicture = request.getParameter("indexPicture");
        String icon = request.getParameter("icon");
        String niname = request.getParameter("niname");
        String yzf = request.getParameter("yzf");

        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);
        blog.setZy(zy);
        blog.setType(type);
        blog.setTag(tag);
        blog.setIndexPicture(indexPicture);
        blog.setIcon(icon);
        blog.setNiname(niname);
        blog.setYzf(yzf);
        BlogDao blogDao = new BlogDao();
        blogDao.add(blog);
        response.sendRedirect(request.getContextPath()+"/findBlogsByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
