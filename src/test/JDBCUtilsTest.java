package test;

import org.junit.Test;
import util.JDBCUtils;

import java.sql.Connection;
import java.sql.SQLException;

import static org.junit.Assert.*;

public class JDBCUtilsTest {

    @Test
    public void getConnection() throws SQLException {
        for (int i = 0; i <100 ; i++) {
            Connection c = JDBCUtils.getConnection();
            System.out.println(c);
            JDBCUtils.close(c);
        }
    }
}