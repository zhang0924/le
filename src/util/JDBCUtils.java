package util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtils {
    private  static DataSource ds;
static {
    try {
    //1.加载配置文件
    Properties pro=new Properties();
    InputStream is = JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties");
        pro.load(is);
    //2。初始化连接池对象
        ds=DruidDataSourceFactory.createDataSource(pro);

    } catch (IOException e) {
        e.printStackTrace();
    } catch (Exception e) {
        e.printStackTrace();
    }


}
    //获取连接池对象
public  static  DataSource getDataSource(){
    return ds;
}

    //获取连接Connection对象
    public static Connection getConnection(){
         Connection conn=null;
        try {
            conn = ds.getConnection();
        } catch (SQLException e) {
          //  e.printStackTrace();
            System.out.println("--未连接到Connection");
        }
        return conn;
    }
    public static void  close(Connection conn){
    if (conn!=null){
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    }
}
