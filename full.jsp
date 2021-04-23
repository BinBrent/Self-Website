<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>  


<html lang="en">

<head>
    <meta charset="UTF-8">
    <!--定义字符集-->
    <meta id="meta" name="viewport"
        content="width = device-width; initial-scale = 1.0; maximum-scale = 1.0; user-scalable = 0;">
    <title>BXXB--55190430</title>
    <link rel="stylesheet" href="css/fullsheet.css">
    <script>
        function getQueryString(key) {
            var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
            var result = window.location.search.substr(1).match(reg);
            return result ? decodeURIComponent(result[2]) : null;
        }
    </script>

    <script>
        function isEmpty() {
            var obj = document.getElementsByName("good");
            var check_val = [];
            url = "jsp/addCart.jsp?";
            url = url + "name=" + getQueryString("name") + "&";
            for (k in obj) {
                if (obj[k].checked) {
                    check_val.push(obj[k].value);
                    url = url + "good=" + obj[k].value + "&";
                }
            }
            if (check_val.length == 0) {
                alert("未选中商品");
                return ;
            }
            url = url.slice(0, url.length - 1);
            window.location.href = url;
        }
    </script>

    <script>
        function goCart() {
            url = "jsp/showCart.jsp?";
            url = url + "name=" + getQueryString("name");
            window.location.href = url;
        }
    </script>

</head>

<body>
    <!--主包装-->
    <nav>
        <!--导航栏-->
        <li class="logo">
            <h1>&nbspBXXB</h1>
        </li>
        <ul>
            <!--导航栏列表-->
            <li>
                <a class="logoutButton" href="loginPage.html">退出登录</a>
            </li>
        </ul>
    </nav>
    <header>
        <!--页眉-->
        <div id="banner">
            <!--小小slogan-->
            <div class="inner">
                <img src="pic/head.jpg" />
                <p class="sub-heading">Hello World</p>
            </div>
        </div>
    </header>
    <!--页眉结束-->
    <div class="content">
        <!--内容开始-->
        <section class="green-section">
            <div class="wrapper">
                <div class="subWrapper">
                    <div class="thirdWrapper">
                        <div class="main-intro">
                            <div class="intro_content">
                                <div>
                                    <h2>主页介绍</h2>
                                    <div class="hr"></div>
                                    <p class="sub-heading">lorem ipsum dolor sit amet,
                                        consectetur adipisicing elit.</p>
                                </div>
                                <div class="icon-group">
                                    <span class="icon">个人介绍<br /><br />普普通通</span>
                                    <span class="icon">兴趣爱好<br /><br />简简单单</span>
                                    <span class="icon">人生经历<br /><br />平平凡凡</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="gray-section">

            <div class="article-preview">
                <div class="article-pic">
                    <img src="pic/jlu.jpg" alt="这里本应该有一张图片" />
                </div>
                <div class="article-text">
                    <div class="text-section">
                        <h2>普普通通的大学生</h2>
                        <p>Formally established in 1946, the aim is to promote cooperation among countries through
                            education, science and culture, and contribute to world peace and security. According to
                            the
                            introduction, UNESCO has 195 Member States and 58 executive board members.</p>
                    </div>
                </div>
            </div>

            <div class="article-preview">
                <div class="article-text">
                    <div class="text-section">
                        <h2>简简单单的兴趣爱好</h2>
                        <p>Formally established in 1946, the aim is to promote cooperation among countries through
                            education, science and culture, and contribute to world peace and security. According to
                            the
                            introduction, UNESCO has 195 Member States and 58 executive board members.</p>
                    </div>
                </div>
                <div class="article-pic">
                    <img src="pic/whiskey.jpg" alt="这里本应该有一张图片" />
                </div>
            </div>

            <div class="article-preview">
                <div class="article-pic">
                    <img src="pic/road.png" alt="这里本应该有一张图片">
                </div>
                <div class="article-text">
                    <div class="text-section">
                        <h2>平平凡凡的人生经历</h2>
                        <p>Formally established in 1946, the aim is to promote cooperation among countries
                            through
                            education, science and culture, and contribute to world peace and security.
                            According to the
                            introduction, UNESCO has 195 Member States and 58 executive board members.</p>
                    </div>
                </div>
            </div>
        </section>

        <%  
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null; 
            String name = new String((request.getParameter("name")).getBytes("ISO-8859-1"),"UTF-8");
            Vector goodName = new Vector();
            Vector goodPrice = new Vector();
            Vector goodPic = new Vector();
            try {  
                Class.forName("com.mysql.cj.jdbc.Driver");  //驱动程序名
                String url = "jdbc:mysql://localhost:3306/website_user?&useSSL=false&serverTimezone=UTC"; //数据库名
                String username = "root";  //数据库用户名
                String password = "123456";  //数据库用户密码
                conn = DriverManager.getConnection(url, username, password);  //连接状态
                if(conn != null) {
                    String sql = "SELECT * FROM good";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        goodName.add(rs.getString("name"));
                        goodPrice.add(rs.getFloat("price"));
                        goodPic.add(rs.getString("addr"));
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
                    if (stmt != null)
                        stmt.close();
                    if (conn != null)
                        conn.close();
                } catch (Exception e) {
                    out.print("操作结束，但是还是失败了"); 
                }
            }  
        %>

        <section class="purple-section">
            <div class="wrapper">

                <form name="cart">
                    <div class="heading-wrapper">
                        <h2>欢迎来到小卖部</h2>
                        <div class="hr"></div>
                        <div class="sub-heading">
                            物美价廉，童叟无欺
                        </div>
                            <input type="button" value="查看购物车" class="showCart" onclick="goCart()">
                    </div>
                        
                        <%
                            for (int i = 0; i < goodName.size(); i++) {
                                out.print("<div class=\"kid\">");
                                out.print("<h3>");
                                out.print(goodName.get(i));
                                out.print("</h3>");
                                out.println("<br />");
                                out.print("<h4>￥");
                                out.print(goodPrice.get(i));
                                out.print("</h4>");
                                out.print("<img src=\"");
                                out.print(goodPic.get(i));
                                out.print("\" loading=\"lazy\" class=\"cardImg\"/>");
                                out.print("<input type=\"checkbox\" name=\"good\" value=\"");
                                out.print(goodName.get(i));
                                out.print("\" />");
                                out.print("</div>");
                            }
                        %>

                        <input type="button" value="添加到购物车" class="cartButton" onclick="isEmpty()">
                </form>
            </div>
        </section>
    </div>
    <!--内容结束-->
    <footer>
        <!--页脚开始-->


        <ul class="share-group">
            <h1>
                也看看我的朋友们吧.
            </h1>
            <br />
            <li><a href="https://www.jlu.edu.cn/">吉林大学</a></li>
            <li><a href="http://jlu.openjudge.cn/">吉大OJ</a></li>
        </ul>

        <div class="copy">
            &copy 许滨-55190430 2021
        </div>
    </footer>
    <!--页脚结束-->

</body>

</html>