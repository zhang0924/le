package service;


import domain.user.Blog;
import domain.user.PageBean;
import domain.user.User;

import java.util.List;
import java.util.Map;

/**
 * 用户管理的业务接口
 */
public interface UserService {

    /**
     * 查询所有用户信息
     * @return
     */
    public List<User> findAll();
    User login(User user);

    /**
     * 保存User
     * @param user
     */
  //  void addUser(User user);

    /**
     * 根据id删除User
     * @param id
     */
    void deleteUser(String id);
    public void addUser(User user);
    /**
     * 根据id查询
     * @param id
     * @return
     */
    User findUserById(String id);

    /**
     * 修改用户信息
     * @param user
     */
   void updateUser(User user);

    /**
     * 批量删除用户
     * @param ids
     */
    void delSelectedUser(String[] ids);

    /**
     * 分页条件查询
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    PageBean<User> findUserByPage(String currentPage, String rows, Map<String, String[]> condition);
}
