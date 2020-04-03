package dao.impl;

import domain.user.User;
import domain.user.Useroot;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

//操作数据库中User表的类
public class UserDao implements dao.UserDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    //登陆方法
    public User login(User loginUser){

        try{
        String sql="select *from user where username=? and password=?";
        User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class),
                loginUser.getUsername(), loginUser.getPassword());

        return user;
        } catch (DataAccessException e){
         //   e.printStackTrace();
            System.out.println("--数据库未查询到用户名和密码");
            return null;
        }
    }
    //查询用户名是否已经存在
    public User queryUser(String username){
        try {
            String sql="select id,username,password,email from user where username=?";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username);
            return user;
        } catch (DataAccessException e) {
          //  e.printStackTrace();
            System.out.println("--用户名可用");
            return null;
        }
    }
// 注册用户信息
public  int saveUser(User user){
    int i = 0;
    try {
        String sql="insert into user(username,password,email) values(?,?,?)";
        i = template.update(sql, user.getUsername(), user.getPassword(), user.getEmail());
    } catch (DataAccessException e) {
     //   e.printStackTrace();
        System.out.println("--这个异常能Catch到算我输");
    }
    return i;
}
//获取用户的所有信息
    public void userData(User user){
        String sql="select id,username,password,email ,datetime from user where username=?";
        Map<String, Object> map = template.queryForMap(sql, user.getUsername());
        //遍历集合
        for (String s : map.keySet()) {
            //System.out.print(s + ":" + map.get(s) + "\t");
            String s1 = s.toString();
            String s2 = map.get(s).toString();
            if (s.equals("id")){
                user.setId(Integer.parseInt(s2));
            }else if (s.equals("username")){
                user.setUsername(s2);
            }else if (s.equals("password")){
                user.setPassword(s2);
            }else if (s.equals("email")){
                user.setEmail(s2);
            }else {
                user.setDatetime(s2);
            }

        }
    }


    public List<User> findAll() {
        //使用JDBC操作数据库...
        //1.定义sql
        String sql = "select * from user order by id";
        List<User> users = template.query(sql, new BeanPropertyRowMapper<User>(User.class));

        return users;
    }


    //root登陆方法
    public Useroot loginroot(Useroot rootlogin){

        try{
            String sql="select *from useroot where username=? and password=?";
            Useroot useroot = template.queryForObject(sql, new BeanPropertyRowMapper<Useroot>(Useroot.class),
                    rootlogin.getUsername(), rootlogin.getPassword());

            return useroot;
        } catch (DataAccessException e){
            //   e.printStackTrace();
            System.out.println("--数据库未查询到用户名和密码");
            return null;
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////
    public User findUserByUsernameAndPassword(String username, String password) {
        try {
            String sql = "select * from user where username = ? and password = ? order by id";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username, password);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public void add(User user) {
        //1.定义sql
        String sql = "insert into user(username,password,email) values(?,?,?)";
        //2.执行sql
        template.update(sql, user.getUsername(),user.getPassword(),user.getEmail());
    }

    public void delete(int id) {
        //1.定义sql
        String sql = "delete from user where id = ?";
        //2.执行sql
        template.update(sql, id);
    }

    public User findById(int id) {
        String sql = "select * from user where id = ? order by id";
        return template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), id);
    }

    public void update(User user) {
        String sql = "update user set username = ?,password = ? , email = ? where id = ?";
        template.update(sql, user.getUsername(), user.getPassword(), user.getEmail(), user.getId());

    }
    public void updateUser(User user) {
        String sql = "update user set username = ?,password = ? , email = ?,niname=?,sex=?,icon=? where id = ?";
        template.update(sql, user.getUsername(), user.getPassword(), user.getEmail(),user.getNiname(),user.getSex(),user.getIcon(), user.getId());

    }
    public int findTotalCount(Map<String, String[]> condition) {
        //1.定义模板初始化sql
        String sql = "select count(*) from user where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        //2.遍历map
        Set<String> keySet = condition.keySet();
        //定义参数的集合
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {

            //排除分页条件参数
            if("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }

            //获取value
            String value = condition.get(key)[0];
            //判断value是否有值
            if(value != null && !"".equals(value)){
                //有值
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }
 /*       System.out.println(sb.toString());
        System.out.println(params);*/

        return template.queryForObject(sb.toString(),Integer.class,params.toArray());
    }

    public List<User> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from user  where 1 = 1 ";

        StringBuilder sb = new StringBuilder(sql);
        //2.遍历map
        Set<String> keySet = condition.keySet();
        //定义参数的集合
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {

            //排除分页条件参数
            if("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }

            //获取value
            String value = condition.get(key)[0];
            //判断value是否有值
            if(value != null && !"".equals(value)){
                //有值
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }

        //添加分页查询
        sb.append(" limit ?,? ");
        //添加分页查询参数值
        params.add(start);
        params.add(rows);
        sql = sb.toString();
        /*System.out.println(sql);
        System.out.println(params);*/

        return template.query(sql,new BeanPropertyRowMapper<User>(User.class),params.toArray());
    }
}
