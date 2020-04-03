package web.servlet;

import com.youbenzi.mdtool.tool.MDTool;
import dao.BlogDao;
import domain.user.Blog;
import domain.user.Comments;
import domain.user.Scang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/addscangservlet")
public class addScangServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");


        String id = request.getParameter("id");
        int i = Integer.parseInt(id);

        String uid = request.getParameter("uid");
          int i1 = Integer.parseInt(uid);
        Scang scang = new Scang();
        scang.setId(i);
        scang.setUid(i1);
        BlogDao blogDao = new BlogDao();
        blogDao.addscang(scang);


        response.sendRedirect(request.getContextPath()+"/acha?id="+i+"&uid="+i1);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
