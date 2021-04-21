<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>  

<html>
    <head>
        <meta charset="UTF-8">
        <script>
            function getQueryString(key) {
                var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
                var result = window.location.search.substr(1).match(reg);
                return result ? decodeURIComponent(result[2]) : null;
            }
        </script>

        <script type="text/javascript">
            function doneAndReturn() {
                alert("操作成功");
                window.location.href = "../full.html?name=" + getQueryString("name");
            }
        </script>
        <script type="text/javascript">
            function noUser() {
                alert("当前无用户登录");
                window.location.href = "../full.html";
            }
        </script>
    </head>

    <body>
        <%  
            Connection conn = null;
            PreparedStatement pre = null;
            ResultSet rs = null; 
            String name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");
            if (name == "") {
                return ;
            }
            String good[] = request.getParameterValues("good");
            try {  
                Class.forName("com.mysql.cj.jdbc.Driver");  //驱动程序名
                String url = "jdbc:mysql://localhost:3306/website_user?&useSSL=false&serverTimezone=UTC"; //数据库名
                String username = "root";  //数据库用户名
                String password = "123456";  //数据库用户密码
                String sql;
                conn = DriverManager.getConnection(url, username, password);  //连接状态
                if(conn != null) {
                              
                    for (int i = 0; i < good.length; i++) {
                        sql = "SELECT * FROM cart WHERE customer = ? and good = ?";
                        pre = conn.prepareStatement(sql);
                        pre.setString(1, name);
                        pre.setString(2, good[i]);
                        rs = pre.executeQuery();
                        if (!rs.next())
                        {
                            sql = "INSERT INTO cart(customer, good) VALUES(?, ?)";
                            pre = conn.prepareStatement(sql);
                            pre.setString(1, name);
                            pre.setString(2, good[i]);
                            pre.executeUpdate();// 执行
                        }
                    }
                    out.println("<script>doneAndReturn();</script>");
                }
                else{  
                    out.print("连接失败！"); 
                }  
            }catch (Exception e) {        
                out.print("操作失败");  
            }finally {
                try {
                    if (rs != null)
                        rs.close();
                    if (pre != null)
                        pre.close();
                    if (conn != null)
                        conn.close();
                } catch (Exception e) {
                    out.print("操作结束，但是还是失败了"); 
                }
            }  
        %>   
        
    </body>


</html>