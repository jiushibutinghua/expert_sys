<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
        <!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
        <!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
        <!--[if IE 8]>    <html class="lt-ie9" lang="en-US"> <![endif]-->
        <!--[if gt IE 8]><!--> <html lang="en-US"> <!--<![endif]-->
        <head>
                <!-- META TAGS -->
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>家庭医生专家系统</title>

                <link rel="shortcut icon" href="images/favicon.png" />

                <!-- Style Sheet-->
                <link rel="stylesheet" href="style.css"/>
                <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />


                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                <script src="js/html5.js"></script>
                <![endif]-->

        </head>

        <body>

                <!-- Start of Header -->
                <div class="header-wrapper">
                        <header>
                                <div class="container">
                                        <!-- Start of Main Navigation -->
                                        <nav class="main-nav">
                                                <div class="menu-top-menu-container">
                                                        <ul id="menu-top-menu" class="clearfix">
                                                                <li class="current-menu-item"><a href="index.jsp">首页</a></li>
                      <li><a href="index.jsp">由病找药</a></li>
                                                                <li><a href="searchMedicine.jsp">药品查询</a></li>
                                                                <li><a href="contact.html">联系我们</a></li>
                                                        </ul>
                                                </div>
                                        </nav>
                                        <!-- End of Main Navigation -->
                                </div>
                        </header>
                </div>
                <!-- End of Header -->

                <!-- Start of Search Wrapper -->
                <div class="search-area-wrapper">
                        <div class="search-area container">
                                <h3 class="search-header">您的家庭医生</h3>
                                <p class="search-tag-subhead">医药专家系统将根据您的输入，为您提供最合适的医药治疗方案</p>

                                <form id="search-form" class="search-form clearfix" method="post" action="./getDiagnoseList" autocomplete="off">
                                        <input class="search-term required" type="text" id="s" name="description" placeholder="输入药品或症状，如发热" title="* 请输入药品或症状的关键词" />
                                        <input class="search-btn" type="submit" value="Search" />
                                        <div id="search-error-container"></div>
                                </form>
                        </div>
                </div>
                <!-- End of Search Wrapper -->
                <div class="copyrights">由 <a href="#" title="见微医智">刘婉玉同学</a>提供服务</div>

                <!-- Start of Page Container -->
                <div class="page-container">
                        <div class="container">
                                <div class="row">

                                        <!-- start of page content -->
                                        <div class="span8 page-content">



                                                <!-- Basic Home Page Template -->
                                                <div class="row separator">
                                                  <c:if test="${searchInfo==null }">
                                                              
                                                              	<img alt="AI人工智能" src="images/ai2.jpg" align="center">
                                                                </c:if>
                                       	<div class="faqs clearfix">
																<h3>
	                                                                <c:if test="${searchInfo!=null }">
	                                                              	 查询的症状为：
	                                                                </c:if>
	                                                              
	                                                            	<c:forEach items="${searchInfo }" var="info">
	                                                            		${info}&nbsp;&nbsp;&nbsp;&nbsp;
	                                                            	</c:forEach>
                                                                </h3>
                                              <c:forEach items="${list }" var="d" varStatus="i">
                                                 <section class="span4 articles-list">
                                                    <article class="faq-item active">
                                                                <span class="faq-icon"></span>
																    <h3 class="faq-question">
																    <a href="#">${d.illness.illnessname}</a>
																    </h3>
                                                               
                                                                <div class="faq-answer">
                                                                            
																	 <ul class="articles">
	                                                                        <li class="article-entry standard">
	                                                                                
	                                                                                <span class="article-meta">诊断可信度：${d.accuracy_rate}</span>
	                                                                                 
	                                                                        </li>
	                                                                        
	                                                                </ul>
	                                                                <ul class="articles">
	                                                                        <li class="article-entry standard">
	                                                                                
	                                                                                <span class="article-meta">类别：${d.illness.division}</span>
	                                                                                 
	                                                                        </li>
	                                                                        
	                                                                </ul>
	                                                                <ul class="articles">
	                                                                        <li class="article-entry standard">
	                                                                                <h4>中医处理：</h4>
	                                                                                <span>${d.illness.prescription_cn}</span>
	                                                                        </li>
	                                                                        
	                                                                </ul>
	                                                                <ul class="articles">
	                                                                        <li class="article-entry standard">
	                                                                                <h4><a href="./goDetailPrescription_en?illID=${d.illness.id }">西医建议：</a></h4>
	                                                                                <span>
																						<c:forEach items="${LmList }" var="list" >
																							<c:forEach items="${list }" var="info">
																							<p>西医处方（处方${info.prescription_id }）:
																								<c:forEach items="${info.medicinelist}" var="m">
																									${m.tradename }&nbsp;&nbsp;
																								</c:forEach>
																							</p>
																							</c:forEach>
																						</c:forEach>
																						<a href="./goDetailPrescription_en?illID=${d.illness.id }">更多详情...</a>
																					</span>
	                                                                        </li>
	                                                                        
	                                                                </ul>
                                                                </div>
                                                    		</article>
                                                        </section>
                                                  </c:forEach>
                                                
                                                </div>


   
                                                        <%--<section class="span4 articles-list">--%>
                                                                <%--<h3>Latest Articles</h3>--%>
                                                                <%--<ul class="articles">--%>
                                                                        <%--<li class="article-entry standard">--%>
                                                                                <%--<h4><a href="single.html">Integrating WordPress with Your Website</a></h4>--%>
                                                                                <%--<span class="article-meta">25 Feb, 2013 in <a href="#" title="View all posts in Server &amp; Database">Server &amp; Database</a></span>--%>
                                                                                <%--<span class="like-count">66</span>--%>
                                                                        <%--</li>--%>
                                                                     <%----%>
                                                                <%--</ul>--%>
                                                        <%--</section>--%>
                                                </div>
                                        </div>
                                        <!-- end of page content -->


                                        <!-- start of sidebar -->
                                        <aside class="span4 page-sidebar">

                                                <section class="widget">
                                                        <div class="support-widget">
                                                                <h3 class="title">家庭医生</h3>
                                                                <p class="intro">它是一个合格的家庭医生。</p>
                                                        </div>
                                                </section>

                                                <section class="widget">
                                                        <div class="quick-links-widget">
                                                                <h3 class="title">快速链接</h3>
                                                                <ul id="menu-quick-links" class="menu clearfix">
                       <li class="current-menu-item"><a href="index.jsp">首页</a></li>
                      <li><a href="index.jsp">由病找药</a></li>
                                                                <li><a href="searchMedicine.jsp">药品查询</a></li>
                                                                </ul>
                                                        </div>
                                                </section>

                                        </aside>
                                        <!-- end of sidebar -->
                                </div>
                        </div>
                </div>
                <!-- End of Page Container -->

                <!-- Start of Footer -->
                <footer id="footer-wrapper">
                        <div id="footer" class="container">
                                <div class="row">

                                        <div class="span3">
                                                <section class="widget">
                                                        <h3 class="title">网站声明</h3>
                                                        <div class="textwidget">
                                                                <p>
	本站使用人工智能的基本原理，根据用户输入的症状为用户提供一个优化的医药方案，但不保证是最优的结果。</p>
                       </div>
                                                </section>
                                        </div>

                                        <div class="span3">
                                                <section class="widget"><h3 class="title">服务分类</h3>
                                                        <ul>
                                 <li><a href="#" title="由病找药">由病找药</a> </li>         <li><a href="#" title="药品信息查询">药品查询</a> </li>
																
                 </ul>
                                                </section>
                                        </div>

                                        <div class="span3">
                                                <section class="widget">
                                                        <h3 class="title">相关网站</h3>
                                                        <div id="twitter_update_list">
                                                                <ol>
                    
					                      <li><a href="http://www.sfda.gov.cn/WS01/CL0412/" target="_blank">国家药监局</a></li>    <li><a href="http://drugs.dxy.cn/search/drug.htm?keyword=白苏子" target="_blank">丁香用药助手</a></li>                              
					  <li><a href="https://db.yaozh.com/pijian/" target="_blank">药智数据</a></li>                                    
					  <li><a href="http://www.yaopinnet.com/zhaoshang/" target="_blank">药源网</a></li>
                                          </ol>
                                                        </div>
                                                       
                                                </section>
                                        </div>

                                        <div class="span3">
                                                <section class="widget">
                                                        <h3 class="title">技术支持</h3>
                                                       <ul> <li><a href="resource/java/jdk8-api/index.html" target="_blank">Java API</a></li> </ul>      
                                                </section>
                                        </div>

                                </div>
                        </div>
                        <!-- end of #footer -->

                        <!-- Footer Bottom -->
                        <div id="footer-bottom-wrapper">
                                <div id="footer-bottom" class="container">
                                        <div class="row">
                                                <div class="span6">
                                                        <p class="copyright">
                                                                Copyright © 2017. All Rights Reserved by<a href="#" title="刘婉玉同学" target="_blank">刘婉玉同学</a>. 
                                                        </p>
                                                </div>
                                                <div class="span6">
                                                        <!-- Social Navigation -->
                                                        <ul class="social-nav clearfix">
                                                                <li class="linkedin"><a target="_blank" href="#"></a></li>
                                                                <li class="google"><a target="_blank" href="#"></a></li>
                                                                <li class="flickr"><a target="_blank" href="#"></a></li>
                                                                <li class="skype"><a target="_blank" href="skype:#?call"></a></li>
                                                                <li class="rss"><a target="_blank" href="#"></a></li>                                                        </ul>
                                                </div>
                                        </div>
                                </div>
                        </div>
                        <!-- End of Footer Bottom -->

                </footer>
                <!-- End of Footer -->

                <a href="#top" id="scroll-top"></a>

                <!-- script -->
                <script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
                <script type='text/javascript' src='js/jquery.easing.1.3.js'></script>
				<script type='text/javascript' src='js/jquery.liveSearch.js'></script>
                <script type='text/javascript' src='js/jquery.form.js'></script>
                <script type='text/javascript' src='js/jquery.validate.min.js'></script>
                <script type='text/javascript' src='js/custom.js'></script>

        </body>
</html>