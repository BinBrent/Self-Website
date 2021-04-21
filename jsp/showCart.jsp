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
    </head>

    <body>
        <%  
            Connection conn = null;
            PreparedStatement pre = null;
            ResultSet rs = null; 
            String name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");
            try {  
                Class.forName("com.mysql.cj.jdbc.Driver");  //驱动程序名
                String url = "jdbc:mysql://localhost:3306/website_user?&useSSL=false&serverTimezone=UTC"; //数据库名
                String username = "root";  //数据库用户名
                String password = "123456";  //数据库用户密码
                String sql;
                Vector good = new Vector();
                conn = DriverManager.getConnection(url, username, password);  //连接状态
                if(conn != null) {
                              
                    sql = "SELECT * FROM cart WHERE customer = ?";
                    pre = conn.prepareStatement(sql);
                    pre.setString(1, name);
                    rs = pre.executeQuery();
                    while (rs.next())
                        good.add(rs.getString("good"));
                    for (int i = 0; i < good.size(); i++)
                        out.println(good.get(i));
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