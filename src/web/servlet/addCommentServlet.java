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

@WebServlet("/addCommentServlet")
public class addCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");


        String uid = request.getParameter("uid");
        int i = Integer.parseInt(uid);
        String bid = request.getParameter("bid");
        int i1 = Integer.parseInt(bid);
        String comment = request.getParameter("comment");
        Comments comments = new Comments();
        comments.setComment(comment);
        comments.setBid(i1);
        comments.setUid(i);
        BlogDao blogDao = new BlogDao();
        blogDao.addComment(comments);
        response.sendRedirect(request.getContextPath()+"/acha?id="+i1+"&uid="+i);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
