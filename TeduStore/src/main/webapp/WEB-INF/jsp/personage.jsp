<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>我的订单 - 达内学子商城</title>
<link href="${basepath}/css/orders.css" rel="stylesheet" />
<link href="${basepath}/css/header.css" rel="stylesheet" />
<link href="${basepath}/css/footer.css" rel="stylesheet" />
<link href="${basepath}/css/personage.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${basepath}/css/icon/css/bootstrap.min.css">
<link href="${basepath}/css/icon/css/cropper.min.css" rel="stylesheet">
<link href="${basepath}/css/icon/css/sitelogo.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${basepath}/css/icon/css/font-awesome.min.css">
</head>
<body>
<%@ include file="/WEB-INF/layout/header.jsp"%>
<!-- 我的订单导航栏-->
<div id="nav_order">
	<ul>
		<li><a href="">首页<span>&gt;</span>个人中心
		</a></li>
	</ul>
</div>
<!--我的订单内容区域 #container-->
<div id="container" class="clearfix">
	<!-- 左边栏 -->
	<%@include file="/WEB-INF/layout/personage_left.jsp" %>
	
	<!-- 右边栏-->
	<div class="rightsidebar_box rt">
	<%@include file="/WEB-INF/layout/personage/personage_right.jsp" %>

	<!--个人信息具体内容 -->
	<div class="rs_content">
		<!--头像-->
		<div class="rs_content_headPortrait">
			<span class="same">我的头像：</span>
			<c:if test="${currentUser.image==null}">
				<img src="${basepath}/images/personage/touxiang.png" alt="头像"
					id="icon" width="50px" height="50px" />
			</c:if>
			<c:if test="${currentUser.image!=null}">
				<img src="${basepath}/${currentUser.image}" alt="头像" id="icon"
					width="50px" height="50px" />
			</c:if>
			<input type="hidden" name="iconPic" value="" id="iconPic"> 
<!-- 			<input type="file" id="iconPic" name="file" onchange="getImage()"/> -->
			<span class="change_headPortrait same_click" data-toggle="modal"
				data-target="#avatar-modal">更改头像</span>
		</div>
		<!--用户名-->
		<div class="rs_content_username">
			<span class="same">用户名：</span> <span class="same rs_username">${currentUser.username}</span>
			<input class="ed_username" value="${currentUser.username}" style="display: none;" id="username"/> <span
				class="change_username same_click">更改用户名</span>
		</div>
		<!--性别-->
		<div class="rs_content_sex">
			<span class="same">性别：</span>
			<c:if test="${currentUser.gender==1}">
				<span class="man select" id="gender_man"> <img
					src="${basepath}/images/personage/select.png" alt="" />男
				</span>
				<span class="women" id="gender_women"> <img
					src="${basepath}/images/personage/un_select.png" alt="" />女
				</span>
			</c:if>
			<c:if test="${currentUser.gender==0}">
				<span class="man" id="gender_man"> <img
					src="${basepath}/images/personage/un_select.png" alt="" />男
				</span>
				<span class="women select" id="gender_women"> <img
					src="${basepath}/images/personage/select.png" alt="" />女
				</span>
			</c:if>
				<c:if test="${currentUser.gender!=0&&currentUser.gender!=1}">
				<span class="man"> <img src="${basepath}/images/personage/un_select.png" alt="" />男
				</span>
				<span class="women "> <img src="${basepath}/images/personage/un_select.png" alt="" />女
				</span>
			</c:if>
		</div>
		<!--绑定电话-->
		<div class="rs_content_tel">
			<span class="same">绑定电话：</span> <input type="text" id="phone" value="${currentUser.phone}" />
		</div>
		<!--绑定邮箱-->
		<div class="rs_content_mail">
			<span class="same">绑定邮箱：</span> <input class="ed_email" id="email" value="${currentUser.email}"
				style="display: none;" /> <span class="rs_mail">${currentUser.email}</span>
			<span class="same_click change_mail">更改邮箱</span>
		</div>
		<div id="rs_msg"></div>
		<!--保存按钮-->
		<div class="save" id="button_save" >保存更改</div>
	</div>
</div>
</div>


<!-- 头像插件 -->
<div class="modal fade" id="avatar-modal" aria-hidden="true"
	aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<!--<form class="avatar-form" action="upload-logo.php" enctype="multipart/form-data" method="post">-->
			<form class="avatar-form">
				<div class="modal-header">
					<button class="close" data-dismiss="modal" type="button">×</button>
					<h4 class="modal-title" id="avatar-modal-label">上传图片</h4>
				</div>
				<div class="modal-body">
					<div class="avatar-body">
						<div class="avatar-upload">
							<input class="avatar-src" name="avatar_src" type="hidden">
							<input class="avatar-data" name="avatar_data" type="hidden">
							<label for="avatarInput" style="line-height: 35px;">图片上传</label>
							<button class="btn btn-info" type="button" style="height: 35px;"
								onClick="$('input[id=avatarInput]').click();">请选择图片</button>
							<span id="avatar-name"></span> <input class="avatar-input hide"
								id="avatarInput" name="avatar_file" type="file">
						</div>
						<div class="row">
							<div class="col-md-9">
								<div class="avatar-wrapper"></div>
							</div>
							<div class="col-md-3">
								<div class="avatar-preview preview-lg" id="imageHead"></div>
								<!--<div class="avatar-preview preview-md"></div> 
                        <div class="avatar-preview preview-sm"></div>-->
							</div>
						</div>
						<div class="row avatar-btns">
							<div class="col-md-4">
								<div class="btn-group">
									<button class="btn btn-info fa fa-undo" data-method="rotate"
										data-option="-90" type="button" title="Rotate -90 degrees">
										向左旋转</button>
								</div>
								<div class="btn-group">
									<button class="btn  btn-info fa fa-repeat" data-method="rotate"
										data-option="90" type="button" title="Rotate 90 degrees">
										向右旋转</button>
								</div>
							</div>
							<div class="col-md-5" style="text-align: right;">
								<button class="btn btn-info fa fa-arrows"
									data-method="setDragMode" data-option="move" type="button"
									title="移动">
									<span class="docs-tooltip" data-toggle="tooltip" title=""
										data-original-title="$().cropper('setDragMode', 'move')">
									</span>
								</button>
								<button type="button" class="btn btn-info fa fa-search-plus"
									data-method="zoom" data-option="0.1" title="放大图片">
									<span class="docs-tooltip" data-toggle="tooltip" title=""
										data-original-title="$().cropper('zoom', 0.1)"> <!--<span class="fa fa-search-plus"></span>-->
									</span>
								</button>
								<button type="button" class="btn btn-info fa fa-search-minus"
									data-method="zoom" data-option="-0.1" title="缩小图片">
									<span class="docs-tooltip" data-toggle="tooltip" title=""
										data-original-title="$().cropper('zoom', -0.1)"> <!--<span class="fa fa-search-minus"></span>-->
									</span>
								</button>
								<button type="button" class="btn btn-info fa fa-refresh"
									data-method="reset" title="重置图片">
									<span class="docs-tooltip" data-toggle="tooltip" title=""
										data-original-title="$().cropper('reset')"  aria-describedby="tooltip866214"></span>
								</button>
							</div>
							
							<div class="col-md-3">
								<button 
									class="btn btn-info btn-block avatar-save fa fa-save"
									type="button" data-dismiss="modal">保存修改</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 页面底部-->
<%@include file="/WEB-INF/layout/foot.jsp"%>
</body>
<script type="text/javascript" src="${basepath}/js/jquery.min.js"></script>

<script src="${basepath}/js/jquery.page.js"></script>
<script type="text/javascript" src="${basepath}/js/orders.js"></script>
<script type="text/javascript" src="${basepath}/js/personal.js"></script>
<script src="${basepath}/js/icon/bootstrap.min.js"></script>
<script src="${basepath}/js/icon/cropper.js"></script>
<script src="${basepath}/js/icon/sitelogo.js"></script>
<script src="${basepath}/js/icon/html2canvas.min.js" type="text/javascript"
	charset="utf-8"></script>
	<script src="${basepath}/js/index.js"></script>
<script type="text/javascript">
	//做个下简易的验证  大小 格式  
	$('#avatarInput').on('change', function(e) {
		var filemaxsize = 1024 * 5;//5M 
		var target = $(e.target);
		var Size = target[0].files[0].size / 1024;
		if (Size > filemaxsize) {
			alert('图片过大，请重新选择!');
			$(".avatar-wrapper").childre().remove;
			return false;
		}
		if (!this.files[0].type.match(/image.*/)) {
			alert('请选择正确的图片!')
		} else {
			var filename = document.querySelector("#avatar-name");
			var texts = document.querySelector("#avatarInput").value;
			var teststr = texts; //你这里的路径写错了 
			testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的 
			filename.innerHTML = testend;
		}

	});

	$(".avatar-save").on("click", function() {
		var img_lg = document.getElementById('imageHead');
		// 截图小的显示框内的内容 
		html2canvas(img_lg, {
			allowTaint : true,
			taintTest : false,
			onrendered : function(canvas) {
				canvas.id = "mycanvas";
				//生成base64图片数据 
				var dataUrl = canvas.toDataURL("image/png");
				var newImg = document.createElement("img");
				newImg.src = dataUrl;
				$("#icon").attr("src", dataUrl);
				imagesAjax(dataUrl)
			}
		});
	})
	function imagesAjax(src) {
		var data = {};
		data.img = src;
		$.ajax({
			url : "${basepath}/user/uploadImage.do",
			data : data,
			type : "POST",
			dataType : 'json',
			success : function(re) {
				if (re) {
					if (re.state=1) {
						//$('#icon').attr('src', re.data.data);
						//$('#iconPic').val(re.data.url);
					} else {
						alert("上传失败");
					}
				}
			}
		});
	}
</script>
<script type="text/javascript">
	$(function() {
		$("#leftsidebar_box .count_managment dt").click();
		$(".rightsidebar_box .rs_header span").siblings().removeClass(
				"rs_header_active");
		$(".rightsidebar_box .rs_header #rs_header_personage").addClass(
				"rs_header_active");

		//保存按钮
		$("#button_save").click(function() {
			//var url = $("#imageHead img").attr("src");
			//$('#icon').attr('src', url);
			var username = $("#username").val();
			var email=$("#email").val();
			var phone=$("#phone").val();
			var gender;
			if($("#gender_women .select")!=null){
				gender=0;
			}else if($("#gender_man .select")!=null){
				gender=1;
			}else{
				gender=-1;
			}
			$.ajax({
				url:"${basepath}/user/update.do",
				data:"username="+username+"&email="+email+"&phone="+phone+"&gender="+gender,
				type:"post",
				datatype:"json",
				success:function(data){
					if(data.state==1){
						$("#rs_msg").text(data.message);
						$("#rs_msg").attr("class","alert alert-success alert-dismissable");
						$("#rs_msg").append($('<button type="button" class="close" data-dismiss="alert"aria-hidden="true">&times;</button>'))
					}
					if(data.state==0){
						$("#rs_msg").text(data.message);
						$("#rs_msg").attr("class","alert alert-danger alert-dismissable");
						$("#rs_msg").append($('<button type="button" class="close" data-dismiss="alert"aria-hidden="true">&times;</button>'))
					}
				}
			})
		})
		
// 		$.ajax({
// 			var url = window.URL.createObjectURL(file);
// 			icon.src=url;
			
			
// 		})
		
		
		
		
	})
	
	
	//上传头像图片
	 
	
	
	

	$("#icon").click(function() {
		window.open($(this).attr("src"));
	})
</script>
<!--<script>
	$(".x").click(function(){
		$(".modal").hide();
	})
	$(".change_headPortrait").click(function(){
		$(".modal").show();
	})
</script>-->
<script>

	
	
</script>
</html>