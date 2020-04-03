
package web.servlet;

import dao.BlogDao;
import domain.user.Blog;
import domain.user.PageBean;
import service.BlogService;
import service.impl.BlogServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;


@WebServlet("/findTagByPageServlet")
public class FindTagByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        //1.获取参数
        String currentPage = request.getParameter("currentPage");//当前页码
        String rows = request.getParameter("rows");//每页显示条数

        if(currentPage == null || "".equals(currentPage)){

            currentPage = "1";
        }


        if(rows == null || "".equals(rows)){
            rows = "8";
        }

        //获取条件查询参数
        Map<String, String[]> condition = request.getParameterMap();


        //2.调用service查询
        BlogService service = new BlogServiceImpl();
        PageBean<Blog> pb = service.findBlogByPage(currentPage,rows,condition);

        // System.out.println(pb);
        BlogDao dao = new BlogDao();
        Object tag1 = dao.findTagCount("1");
        Object tag2 = dao.findTagCount("2");
        Object tag3 = dao.findTagCount("3");
        Object tag4 = dao.findTagCount("4");
        Object tag5 = dao.findTagCount("5");
        //3.将PageBean存入request
        request.setAttribute("tag1",tag1);
        request.setAttribute("tag2",tag2);
        request.setAttribute("tag3",tag3);
        request.setAttribute("tag4",tag4);
        request.setAttribute("tag5",tag5);
        request.setAttribute("pb",pb);
        request.setAttribute("condition",condition);//将查询条件存入request
        //4.转发到list.jsp
        request.getRequestDispatcher("tags.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
