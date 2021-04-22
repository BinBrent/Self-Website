<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>  


<html lang="en">

<head>
    <meta charset="UTF-8">
    <!--定义字符集-->
    <meta name="keywords" content="HTML,JSP,CSS,SQL">
    <!--查找关键字-->
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
                <img src="pic/tutor.jpg" />
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

        <section class="purple-section">
            <div class="wrapper">

                <form name="cart">
                    <div class="heading-wrapper">
                        <h2>欢迎来到小卖部</h2>
                        <div class="hr"></div>
                        <div class="sub-heading">
                            物美价廉，童叟无欺
                        </div>
                        <div>
                            <input type="button" value="添加到购物车" class="showCart" onclick="isEmpty()">
                            <input type="button" value="查看购物车" class="showCart" onclick="goCart()">
                        </div>
                    </div>
                    <div class="card-group 
                clearfix">
                        <div class="card">
                            <h3>手表</h3>
                            <p>
                                西铁城手表
                                <br />
                                小蓝针男表光动能小牛皮表带时尚休闲腕表
                            </p>
                            <img src="pic/watch.jpg" loading="lazy" class="cardImg" />
                            <input type="checkbox" name="good" value="watch" />
                        </div>
                        <div class="card">
                            <h3>威士忌</h3>
                            <p>
                                山崎
                                <br />
                                威士忌
                            </p>
                            <img src="pic/alcohol.jpg" loading="lazy" class="cardImg" />
                            <input type="checkbox" name="good" value="whiskey" />
                        </div>
                    </div>

                    <div class="card-group
			clearfix">
                        <div class="card">
                            <h3>维生素</h3>
                            <p>
                                拯救久经熬夜的身体
                            </p>
                            <img src="pic/medicine.jpg" loading="lazy" class="cardImg" />
                            <input type="checkbox" name="good" value="medicine"/>
                        </div>
                        <div class="card">
                            <h3>骨灰盒</h3>
                            <p>人生的归宿
                            </p>
                            <img src="pic/box.jpg" loading="lazy" class="cardImg"/>
                            <input type="checkbox" name="good" value="box" />
                        </div>
                    </div>
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
            <li><a href="#">item</a></li>
            <li><a href="#">item</a></li>
            <li><a href="#">item</a></li>
            <li><a href="#">item</a></li>
            <li><a href="#">item</a></li>
        </ul>

        <div class="copy">
            &copy 许滨-55190430 2021
        </div>
    </footer>
    <!--页脚结束-->

</body>

</html>