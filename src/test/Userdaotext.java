package test;

import dao.impl.UserDao;
import domain.user.User;

public class Userdaotext {

    public static void  testLogin(){
        User loginuser=new User();
        loginuser.setUsername("zhang");
        loginuser.setPassword("123");
        UserDao dao=new UserDao();
        User user =dao.login(loginuser);
        System.out.println(user);
    }

    public static void main(String[] args) {
        String s="shdfksjdhf";
       s.replaceAll("s", "55");
        System.out.println(s);

    }
}
