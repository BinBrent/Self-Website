<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>  

<html>
    <head>
        <meta charset="UTF-8">
        <link  rel="stylesheet" href="../css/cart.css">
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
                window.location.href = "../full.jsp?name=" + getQueryString("name");
            }
        </script>
        
    </head>

    <body>
        <section>
            <div class="box">
                <div class="container">
                    <div class="form">
                        <table border="1">
                            <caption><h2>您的购物车<h2></caption>
                            <tr>
                                <th>您的用户名</th>
                                <th>您的商品</th>
                                <th>购买商品</th>
                                <th>删除商品</th>
                            </tr>
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
                                        for (int i = 0; i < good.size(); i++) {
                                            out.print("<tr>");
                                            
                                                    out.print("<th>");
                                                        out.print(name);
                                                    out.print("</th>");

                                                    out.print("<th>");
                                                        out.print(good.get(i));
                                                    out.print("</th>");

                                                    out.print("<th>");
                                                    out.print("<form action=\"buy.jsp\" method=\"POST\">");
                                                        out.print("<input name=\"customer\" class=\"hide\" type=\"text\" value=\""+ name + "\">");
                                                        out.print("</input>");

                                                        out.print("<input name=\"good\" class=\"hide\" type=\"text\" value=\""+ good.get(i) + "\">");
                                                        out.print("</input>");

                                                        out.print("<input type=\"submit\" value=\"购买\">");
                                                        out.print("</input>");
                                                    out.print("</form>");
                                                    out.print("</th>");

                                                    out.print("<th>");
                                                    out.print("<form action=\"del.jsp\" method=\"POST\">");
                                                        out.print("<input name=\"customer\"  class=\"hide\" type=\"text\" value=\"");
                                                        out.print(name + "\">");
                                                        out.print("</input>");

                                                        out.print("<input name=\"good\" class=\"hide\" type=\"text\" value=\""+ good.get(i) + "\">");
                                                        out.print("</input>");

                                                        out.print("<input type=\"submit\" value=\"删除\" >");
                                                        out.print("</input>");
                                                    out.print("</form>");
                                                    out.print("</th>");

                                            out.print("</tr>");
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
                                    } catch (Exception e) {
                                        out.print("操作结束，但是还是失败了"); 
                                    }
                                }  
                            %>   
                        </table>
                    
                    </div>
                </div>
            </div>
        </section>
    </body>


</html>