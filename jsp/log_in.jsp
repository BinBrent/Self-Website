<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>  

<html>
<head>
    <meta charset="UTF-8">
    
    <script>
        function reLogin() {
            alert("信息输入错误,请重新登录");
            window.location.href = "../loginPage.html";
        }
    </script>

</head>
<body>

    <%  
        boolean isValid = false;
        Connection conn = null;
        PreparedStatement pre = null;
        ResultSet rs = null; 
        String name = new String((request.getParameter("username")).getBytes("ISO-8859-1"),"UTF-8");
        String pwd = new String((request.getParameter("password")).getBytes("ISO-8859-1"),"UTF-8");
        try {  
            Class.forName("com.mysql.cj.jdbc.Driver");  //驱动程序名
            String url = "jdbc:mysql://localhost:3306/website_user?&useSSL=false&serverTimezone=UTC"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            conn = DriverManager.getConnection(url, username, password);  //连接状态
            if(conn != null) {      
                String sql = "SELECT * FROM user where username = ? and password = ?";  //查询语句
                
                pre = conn.prepareStatement(sql);
                pre.setString(1, name);
                pre.setString(2, pwd);
                rs = pre.executeQuery();
                if (rs.next())
                {
                    isValid = true;
                }
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
                if (isValid == true) { 
                    String addr = "../full.html?name=";
                    addr += name;
                    response.sendRedirect(addr);
                } else {
                    out.println("<script>reLogin();</script>");
                }
            } catch (Exception e) {
                out.print("操作结束，但是还是失败了"); 
            }
        }  
    %>   

</body>
</html>