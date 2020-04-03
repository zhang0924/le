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

@WebServlet("/addscang")
public class addScang extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");


        String id = request.getParameter("id");
        int i = Integer.parseInt(id);



        BlogDao blogDao = new BlogDao();
        List<Scang> scang = blogDao.scang(i);
        request.setAttribute("scang",scang);

        request.getRequestDispatcher("/htmls/scang.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
