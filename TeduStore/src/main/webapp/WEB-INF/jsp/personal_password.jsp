<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <title>我的订单 - 达内学子商城</title>
    <link href="${basepath}/css/orders.css" rel="Stylesheet"/>
    <link href="${basepath}/css/header.css" rel="Stylesheet"/>
    <link href="${basepath}/css/footer.css" rel="Stylesheet"/>
    <link href="${basepath}/css/personage.css" rel="stylesheet" />

    
<%@ include file="/WEB-INF/layout/header.jsp"%>
<%-- <jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include> --%>
<!-- 我的订单导航栏-->
<div id="nav_order">
    <ul>
        <li><a href="">首页<span>&gt;</span>个人中心</a></li>
    </ul>
</div>
<!--我的订单内容区域 #container-->
<div id="container" class="clearfix">

    <!-- 左边栏-->
   <%@include file="/WEB-INF/layout/personage_left.jsp" %>
    <!-- 右边栏-->
    	<div class="rightsidebar_box rt">
   	<%@include file="/WEB-INF/layout/personage/personage_right.jsp" %>

        <!--安全管理 -->
        <div class="rs_content">
            <p class="change_password_title">更改密码</p>
            <div class="new_password">
                <span class="word">输入旧密码：</span><input type="password" id="oldpassword" pattern="^.{6,12}$" required="required"/><span class="change_hint"></span>
            </div>
            <div class="new_password">
                <span class="word">输入新密码：</span><input type="password" id="newpassword" pattern="^.{6,12}$"  required="required"/><span class="change_hint"></span>
            </div>
            <div class="confirm_password">
                <span class="word">确认新密码：</span><input type="password" id="repassword" pattern="^.{6,12}$"  required="required"/><span class="confirm_hint"></span>
            </div>
            
            <div  class="confirm_password"> 
            	<div  id="result_message"></div>
            </div>
            <div class="save_password" id="btn_save_password">
                保存更改
            </div>
        </div>


    </div>
</div>

<!-- 页面底部-->
<%@include file="/WEB-INF/layout/foot.jsp"%>

</body>
<script type="text/javascript" src="${basepath}/js/jquery-3.1.1.min.js"></script>
<script src="${basepath}/js/index.js"></script>
<script src="${basepath}/js/jquery.page.js"></script>
<script type="text/javascript" src="${basepath}/js/orders.js"></script>
<script type="text/javascript" src="${basepath}/js/icon/bootstrap.min.js"></script>"
<link rel="stylesheet" href="${basepath}/css/icon/css/bootstrap.min.css">
<script type="text/javascript">
$(function(){
	//处理左侧边栏
	$("#leftsidebar_box .count_managment dt").click();
	//处理右侧上边栏
	$(".rightsidebar_box .rs_header span").siblings().removeClass("rs_header_active");
	$(".rightsidebar_box .rs_header #rs_header_password").addClass("rs_header_active");
	
	//保存更改 按钮事件
	$("#btn_save_password").click(function(){
		$objects = $(":password");lass="avatar-input hide"
		
		for(var i=0;i<$objects.length;i++){
			if($objects[i].validity.patternMismatch){
				return null;
			}
			if($objects[i].validity.valueMissing){
				return null
			}
		}
		
		
		
		$.ajax({
			url:"${basePath}/user/changePassword.do",
			type:"post",
			data:"oldpassword="+$("#oldpassword").val()+"&newpassword="+$("#newpassword").val()+"&repassword="+$("#repassword").val(),
			datatype:"json",
			success:function(data){
				if(data.state==1){
					$("#result_message").attr("class", "alert alert-success alert-dismissable")
					$("#result_message").text(data.message);
					$("#result_message").append($('<button type="button" class="close" data-dismiss="alert"aria-hidden="true">&times;</button>'))

				}
				if(data.state==0){
					$("#result_message").attr("class", "alert alert-danger alert-dismissable")
					$("#result_message").text(data.message);
					$("#result_message").append($('<button type="button" class="close" data-dismiss="alert"aria-hidden="true">&times;</button>'))
				}
			}
		})
	})
	
	//失去焦点事件,校验密码格式

	$(":password").blur(function(){
		if(!this.validity.patternMismatch&&!this.validity.valueMissing){
			$(this).next().text("格式验证通过");
			$(this).next().css("color","green");
// 			$(this).next().addClass("msg-success");
// 			$(this).next().removeClass("msg-default");
// 			$(this).next().removeClass("msg-error");
		}else{
			$(this).next().text("密码长度在6到12位之间");
			$(this).next().css("color","red");
	
		}
	})

		$(":password").focus(function(){
			$(this).next().text("密码长度在6到12位之间");
			$(this).next().css("color","gray");
	})
		$(":password").next().text("密码长度在6到12位之间");
		$(":password").next().css("color","gray");
	
	
	
})

</script>
</html>