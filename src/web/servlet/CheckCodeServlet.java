package web.servlet;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/code")
public class CheckCodeServlet extends HttpServlet
{

    private int width = 90;

    private int height = 30;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics g = img.getGraphics();
        Random random = new Random();
        Color bfColor = new Color( 204, 205, 208);
        Color a1 = new Color(  226, 56, 18 );
        Color a2 = new Color( 239, 229, 17 );
        Color a3 = new Color(   17, 182, 15   );
        Color a4 = new Color(  15, 85, 182  );
        Color a5 = new Color(  182, 15, 179  );


        g.setColor(bfColor);
        g.fillRect(0, 0, width, height);

        Font font = new Font("verdana", Font.BOLD+ Font.ITALIC, 23);
        g.setFont(font);

        // 边框
        g.setColor(Color.white);
        g.drawRect(0, 0, width - 1, height - 1);
        // 干扰点
        for (int i = 0; i < 600; i++) {
            //干扰点的颜色随机生成
            int j = random.nextInt(5);
            if(j==0){
            g.setColor(a1);
            }else if (j==1){
            g.setColor(a2);
            }else if (j==2){
            g.setColor(a3);
            }else if(j==3){
            g.setColor(a4);
            }else {
            g.setColor(a5);

            }
            //保证干扰点不会生成到边框上或边框外
            int x = random.nextInt(width-5)+2;
            int y = random.nextInt(height-5)+2;
            int x1 = random.nextInt(2);
            int y1 = random.nextInt(2);
            g.drawLine(x, y, x + x1, y + y1);
        }

        // 保存验证码
        StringBuffer randomCode = new StringBuffer();
        int red = 0;
        int green = 0;
        int blue = 0;

        // 生成验证码
        String s="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz0123456789";

        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < 4; i++) {
            char c = s.charAt(random.nextInt(s.length()));
            String strRand=c+"";
        //验证码每个字母颜色随机
            red = random.nextInt(120);
            green = random.nextInt(130);
            blue = random.nextInt(140);

            g.setColor(new Color(red, green, blue));
            g.drawString(strRand, 21 * i + 6, 22);

            randomCode.append(strRand);
            sb.append(c);
        }

        String checkCode_session = sb.toString();
        System.out.println("===========================================================================================");
        System.out.println("++"+req.getSession());
        System.out.println("系统生成的验证码："+checkCode_session);


   /*
        // 禁止图象缓存
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", 0);
        resp.setContentType("image/jpeg");
*/
        req.getSession().setAttribute("checkCode_session",checkCode_session);
        // 输出图象
        ServletOutputStream sos = resp.getOutputStream();
        ImageIO.write(img, "jpeg", sos);
        sos.close();
    }
}

