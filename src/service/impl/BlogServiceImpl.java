package service.impl;

import dao.BlogDao;
import domain.user.Blog;
import domain.user.PageBean;
import service.BlogService;

import java.util.List;
import java.util.Map;

public class BlogServiceImpl implements BlogService {
    private BlogDao dao=new BlogDao();
    @Override
    public PageBean<Blog> findBlogByPage(String _currentPage, String _rows, Map<String, String[]> condition) {

        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean对象
        PageBean<Blog> pb = new PageBean<Blog>();
        //2.设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        //3.调用dao查询总记录数
        int totalCount = dao.findTotalCount(condition);
        pb.setTotalCount(totalCount);
        //4.调用dao查询List集合
        //计算开始的记录索引
        int start = (currentPage - 1) * rows;
        List<Blog> list = dao.findByPage(start,rows,condition);
        pb.setList(list);
        //5.计算总页码
        int totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
        pb.setTotalPage(totalPage);


        return pb;
    }
}
