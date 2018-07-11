<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 页面顶部-->
<header id="top" class="fixed_nav">
    <div id="logo" class="lf">
        <img class="animated jello" src="${basepath}/images/header/logo.png" alt="logo"/>
    </div>
    <div id="top_input" class="lf">
        <input id="input" type="text" placeholder="请输入您要搜索的内容"/>
        <a href="search.html" class="rt"><img id="search" src="${basepath}/images/header/search.png" alt="搜索"/></a>
    </div>
    <div class="rt">
        <ul class="lf"> 
        <li>
        <c:if test="${currentUser!=null}"><a href="${basepath}/user/personage.do"tiltle="当前用户"><span>${currentUser.username}</span></a> </c:if><b>|</b>
            <li><a href="favorites.html" title="我的收藏"><img class="care" src="${basepath}/images/header/care.png" alt=""/></a><b>|</b></li>
            <li><a href="orders.html" title="我的订单"><img class="order" src="${basepath}/images/header/order.png" alt=""/></a><b>|</b></li>
            <li><a href="cart.html" title="我的购物车"><img class="shopcar" src="${basepath}/images/header/shop_car.png" alt=""/></a><b>|</b></li>
            <li><a href="help.html">帮助</a><b>|</b></li>
            <li><li><c:if test="${currentUser==null}"><a href="${basepath}/user/login.do">登录</a></c:if>
            				<c:if test="${currentUser!=null}"><a href="javascript:exit();" >注销 </a></c:if>
            </li>
        </ul>
    </div>
</header>
<!-- nav主导航-->
<nav id="nav">
    <ul>
        <li><a href="index.html" class="acti">首页</a></li>
        <li><a href="index.html#computer" >电脑办公</a></li>
        <li><a href="index.html#stationery" >办公文具</a></li>
    </ul>
</nav>
<script type="text/javascript" src="${basePath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${basePath}/jquery/jquery.cookie.js"></script> 


<script>
function exit(){
	$.ajax({
		url:"${basepath}/user/exit.do",
		type:"post",
		datatype:"json",
		success:function(data){
			if(data.state==1){
				location="${basepath}/main/index.do";
			}else{
					$.cookie("JSESSIONID", "", { expire: -1 });
							location="${basepath}/main/index.do";
			}}
	})
}
</script>