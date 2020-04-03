package dao;

import domain.user.Blog;
import domain.user.Comments;
import domain.user.Scang;
import domain.user.User;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.*;

public class BlogDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    public void add(Blog blog) {
        //1.定义sql
        String sql = "insert into zblog(title,content,zy,type,tag,indexpicture,icon,niname,yzf) values(?,?,?,?,?,?,?,?,?)";
        //2.执行sql
        template.update(sql, blog.getTitle(),blog.getContent(),blog.getZy(),blog.getType(),blog.getTag(),blog.getIndexPicture(),blog.getIcon(),blog.getNiname(),blog.getYzf());
    }
    public void updateBlog(Blog blog) {
        String sql = "update zblog set title = ?,content = ? , zy = ?,type=?,tag=?,indexpicture=?,yzf=? where id = ?";
        template.update(sql, blog.getTitle(),blog.getContent(),blog.getZy(),blog.getType(),blog.getTag(),blog.getIndexPicture(),blog.getYzf(),blog.getId());

    }
    public Blog queryBlog(int id){
        try {
            String sql2="update zblog set eye=eye+1 where id=?";
            template.update(sql2,id);
            String sql="select * from zblog where id=?";
            Blog blog = template.queryForObject(sql, new BeanPropertyRowMapper<Blog>(Blog.class),id);
            return blog;
        } catch (DataAccessException e) {
            //  e.printStackTrace();
            System.out.println("-没有此条内容");
            return null;
        }
    }
    public Blog updateBlog(int id){
        try {
            String sql="select * from zblog where id=?";
            Blog blog = template.queryForObject(sql, new BeanPropertyRowMapper<Blog>(Blog.class),id);
            return blog;
        } catch (DataAccessException e) {
            //  e.printStackTrace();
            System.out.println("-没有此条内容");
            return null;
        }
    }
    public List<Blog> news(){
        String sql="select id,title from zblog ORDER BY datetime DESC LIMIT 0,8";
        List<Blog> blogs = template.query(sql, new BeanPropertyRowMapper<Blog>(Blog.class));
        return blogs;
    }
    public List<Blog> newss(){
        String sql="select id,title from zblog ORDER BY eye DESC LIMIT 0,3";
        List<Blog> blogs = template.query(sql, new BeanPropertyRowMapper<Blog>(Blog.class));
        return blogs;
    }
    public List<Blog> years(){
        String sql="select id,title,datetime,yzf from zblog WHERE datetime>'2020-01-01' ORDER BY datetime DESC";
        List<Blog> blogs = template.query(sql, new BeanPropertyRowMapper<Blog>(Blog.class));
        return blogs;
    }
    public List<Comments> comments(int id){
        String sql="SELECT user.username,comments.comment,comments.datetime,user.niname,user.icon FROM user,comments,zblog WHERE zblog.id=? AND comments.bid=zblog.id and comments.uid=user.id ORDER BY comments.datetime";
        List<Comments> comments = template.query(sql, new BeanPropertyRowMapper<Comments>(Comments.class), id);
        return comments;
    }
    public List<Scang> scang(int id){
        String sql="SELECT zblog.id,zblog.title,scang.datetime FROM user,zblog,scang WHERE user.id=? AND scang.uid=user.id AND scang.bid=zblog.id ORDER BY scang.datetime DESC";
        List<Scang> scang = template.query(sql, new BeanPropertyRowMapper<Scang>(Scang.class), id);
        return scang;
    }
    public int findTotalCount(Map<String, String[]> condition) {
        //1.定义模板初始化sql
        String sql = "select count(*) from zblog where 1 = 1 ";
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
    public Object findTypeCount(String type) {
        //1.定义模板初始化sql
        String sql = "select count(*) from zblog where type=?";

        Map<String, Object> map = template.queryForMap(sql,type);
        Set<String> keySet = map.keySet();
        //遍历键的集合，获取到每一个键。用增强for实现
        Object value=null;
        for (String key : keySet) {
            //根据键去找值。用get(Object key)方法实现
            value = map.get(key);

        }
            return value;
    }
    public Object findTagCount(String tag) {
        //1.定义模板初始化sql
        String sql = "select count(*) from zblog where tag like ?";

        Map<String, Object> map = template.queryForMap(sql,"%"+tag+"%");
        Set<String> keySet = map.keySet();
        //遍历键的集合，获取到每一个键。用增强for实现
        Object value=null;
        for (String key : keySet) {
            //根据键去找值。用get(Object key)方法实现
            value = map.get(key);

        }
        return value;
    }

    public List<Blog> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from zblog  where 1 = 1 ";

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

        return template.query(sql,new BeanPropertyRowMapper<Blog>(Blog.class),params.toArray());
    }
    public void addComment(Comments comments) {
        //1.定义sql
        String sql = "insert into comments(comment,uid,bid) values(?,?,?)";
        //2.执行sql
        template.update(sql,comments.getComment(),comments.getUid(),comments.getBid());
    }
    public void addscang(Scang scang) {
        //1.定义sql
        String sql = "insert into scang(uid,bid) values(?,?)";
        //2.执行sql
        template.update(sql,scang.getUid(),scang.getId());
    }
    public int queryscang(int uid,int bid){
        try {
            String sql="select * from scang where uid=? and bid=?";
            Scang scang = template.queryForObject(sql, new BeanPropertyRowMapper<Scang>(Scang.class),uid,bid);

            return 1;
        } catch (DataAccessException e) {
            //  e.printStackTrace();
            System.out.println("--未收藏或scang数据库数据重复导致template封装失败");
            return 0;
        }
    }
    public void delete(int id) {
        //1.定义sql
        String sql = "delete from zblog where id = ?";
        //2.执行sql
        template.update(sql, id);
    }
}
