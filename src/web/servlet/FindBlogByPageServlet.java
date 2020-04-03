
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
import java.util.List;
import java.util.Map;



@WebServlet("/findBlogByPageServlet")
public class FindBlogByPageServlet extends HttpServlet {
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

        //3.将PageBean存入request
        BlogDao dao = new BlogDao();
        Object type1 = dao.findTypeCount("1");
        Object type2 = dao.findTypeCount("2");
        Object type3 = dao.findTypeCount("3");
        Object type4 = dao.findTypeCount("4");
        Object type5 = dao.findTypeCount("5");
        //3.将PageBean存入request
        request.setAttribute("typy1",type1);
        request.setAttribute("typy2",type2);
        request.setAttribute("typy3",type3);
        request.setAttribute("typy4",type4);
        request.setAttribute("typy5",type5);

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
        List<Blog> news = dao.news();
        request.setAttribute("news",news);
        request.getRequestDispatcher("HomePage.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
