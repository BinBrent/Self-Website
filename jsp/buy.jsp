<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>  

<html>
<head>
    <meta charset="UTF-8">
</head>
<body>

    <%  
        Connection conn = null;
        PreparedStatement pre = null;
        ResultSet rs = null; 
        String name = new String((request.getParameter("customer")).getBytes("ISO-8859-1"),"UTF-8");
        String good = new String((request.getParameter("good")).getBytes("ISO-8859-1"),"UTF-8");
        try {  
            Class.forName("com.mysql.cj.jdbc.Driver");  //驱动程序名
            String url = "jdbc:mysql://localhost:3306/website_user?&useSSL=false&serverTimezone=UTC"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            conn = DriverManager.getConnection(url, username, password);  //连接状态
            if(conn != null) {      
                String sql = "INSERT INTO record(customer, good) VALUES(?, ?)";
                pre = conn.prepareStatement(sql);
                pre.setString(1, name);
                pre.setString(2, good);
                pre.executeUpdate();
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
                request.setAttribute("name", name);
                request.setAttribute("good", good);
                request.getRequestDispatcher("del.jsp").forward(request,response);
            } catch (Exception e) {
                out.print("操作结束，但是还是失败了"); 
            }
        }  
    %>   
</body>
</html>