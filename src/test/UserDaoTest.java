package test;

import dao.impl.UserDao;
import domain.user.User;
import domain.user.Useroot;
import org.junit.Test;

public class UserDaoTest {

    @Test
    public void login() {
        User loginuser=new User();
        loginuser.setUsername("zhang");
        loginuser.setPassword("123");
        UserDao dao=new UserDao();
        User user =dao.login(loginuser);
        System.out.println(user);
    }
    @Test
    public void query(){
        UserDao dao=new UserDao();
        User user = dao.queryUser("zhag");
        System.out.println(user);

    }
    @Test
    public void save(){
        User loginuser=new User();
        loginuser.setUsername("zhannng");
        loginuser.setPassword("123");
        loginuser.setEmail("123@qq.com");
        UserDao dao=new UserDao();
        System.out.println(dao.saveUser(loginuser));
    }
    @Test
    public void udate(){
        User user = new User();
        user.setUsername("lele");
        UserDao dao = new UserDao();
        dao.userData(user);
        System.out.println(user);
    }
    @Test
    public void findall(){
        UserDao dao=new UserDao();
        System.out.println(dao.findAll());
    }
    @Test
    public void rootlogin(){
        Useroot useroot = new Useroot(1,"zhanglele","1234");
        UserDao dao = new UserDao();
        System.out.println(dao.loginroot(useroot));
    }
}