package web.servlet;

import com.youbenzi.mdtool.tool.MDTool;
import dao.BlogDao;
import domain.user.Blog;
import domain.user.Comments;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/acha")
public class acha extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");


        String id = request.getParameter("id");
        int i = Integer.parseInt(id);

        BlogDao blogDao = new BlogDao();
        Blog blog = blogDao.queryBlog(i);
        String s = MDTool.markdown2Html(blog.getContent());
        String s1 = s.replaceAll("<code>", "<code class=\"language-java\">");
        request.setAttribute("blog",blog);
        request.setAttribute("s1",s1);
        List<Comments> comments = blogDao.comments(i);
        String uid = request.getParameter("uid");
        if (uid!=null&&!"".equals(uid)){
            int i1 = Integer.parseInt(uid);
            int flag = blogDao.queryscang(i1, i);
            request.setAttribute("flag",flag);
        }
        request.setAttribute("comments",comments);
        request.setAttribute("id",i);
        request.getRequestDispatcher("/blog.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
