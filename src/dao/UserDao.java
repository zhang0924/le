package dao;

import domain.user.User;
import domain.user.Useroot;

import java.util.List;
import java.util.Map;

public interface UserDao {
    User login(User loginUser);    //登陆方法
    User queryUser(String username);//查询用户名是否已经存在
    // 注册用户信息
     int saveUser(User user);
    //获取用户的所有信息
    public void userData(User user);
    public List<User> findAll();
    //admin登陆方法
    public Useroot loginroot(Useroot rootlogin);
    User findUserByUsernameAndPassword(String username, String password);
    public void add(User user);
    public void delete(int id);
    User findById(int id);
    int findTotalCount(Map<String, String[]> condition);
    List<User> findByPage(int start, int rows, Map<String, String[]> condition);
}
