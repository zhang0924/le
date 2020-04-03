package service;

import domain.user.Blog;
import domain.user.PageBean;

import java.util.Map;

public interface BlogService {
    PageBean<Blog> findBlogByPage(String currentPage, String rows, Map<String, String[]> condition);

}
