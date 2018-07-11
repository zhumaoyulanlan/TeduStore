<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
<head lang="en">
    <meta charset="UTF-8">
    <title>我的订单 - 达内学子商城</title>
    <link href="../css/orders.css" rel="stylesheet"/>
    <link href="../css/header.css" rel="stylesheet"/>
    <link href="../css/footer.css" rel="stylesheet"/>
    <link href="../css/personage.css" rel="stylesheet" />
</head>
<body>
<%@ include file="/WEB-INF/layout/header.jsp"%>
<!-- 我的订单导航栏-->
<div id="nav_order">
    <ul>
        <li><a href="">首页<span>&gt;</span>个人中心</a></li>
    </ul>
</div>
<!--我的订单内容区域 #container-->
<div id="container" class="clearfix">
    <!-- 左边栏 -->
	<%@include file="/WEB-INF/layout/personage_left.jsp" %>
   <!-- 右边栏-->
    <div class="rightsidebar_box rt">	
        <!--标题栏-->
        <div class="rs_header">
            <span class="address_title">收获地址管理</span>
        </div>
        <!--收货人信息填写栏-->
        <div class="rs_content">
        	<form method="post" action="">
        	
        	
<!--         	id -->

			<div class="recipients" hidden=hidden >
	                <span class="red">*</span><span class="kuan">id：</span><input type="text" name="receiverId" id="receiverId" maxlength="50" />
	            </div>

	            <!--收货人姓名-->
	            <div class="recipients">
	                <span class="red">*</span><span class="kuan">收货人：</span><input type="text" name="receiverName" id="receiverName" maxlength="50" />
	            </div>
	            <!--收货人所在城市等信息-->
	            <div data-toggle="distpicker" class="address_content">
					 <span class="red">*</span><span class="kuan">省&nbsp;&nbsp;份：</span><select data-province="---- 选择省 ----" id="receiverState"></select>
					  城市：<select data-city="---- 选择市 ----" id="receiverCity"></select>
					  区/县：<select data-district="---- 选择区 ----" id="receiverDistrict"></select>
				</div>


					<!--收货人详细地址-->
					<div class="address_particular">
						<span class="red">*</span><span class="kuan">详细地址：</span>
						<textarea name="receiverAddress" id="receiverAddress" cols="60"
							rows="3" placeholder="建议您如实填写详细收货地址" maxlength="100"></textarea>
					</div>
					<!--收货人地址-->
					<div class="address_tel">
						<span class="red">*</span><span class="kuan">手机号码：</span><input
							type="tel" id="receiverMobile" name="receiverMobile"
							pattern="^1[3|4|5|8][0-9]\d{4,8}$" maxlength="32" />固定电话：<input
							type="text" name="receiverPhone" id="receiverPhone"
							maxlength="32" />
					</div>
					<!--邮政编码-->
					<div class="address_postcode">
						<span class="red">&nbsp;</span class="kuan"><span>邮政编码：</span>&nbsp;<input
							type="text" name="receiverZip" id="receiverZip" pattern="^\d{6}$" />
					</div>
					<!--地址名称-->
					<div class="address_name">
						<span class="red">&nbsp;</span class="kuan"><span>地址名称：</span>&nbsp;<input
							type="text" id="addressName" name="addressName" maxlength="6" />如：<span
							class="sp">家</span><span class="sp">公司</span><span class="sp">宿舍</span>
					</div>
					<!--保存收货人信息-->
					<div class="save_recipient" id="btn_save_recipient">保存收货人信息</div>

				</form>
            <!--已有地址栏-->
            <div class="address_information_manage">
                <div class="aim_title">
                    <span class="dzmc dzmc_title">地址名称</span><span class="dzxm dzxm_title">姓名</span><span class="dzxq dzxq_title">地址详情</span><span class="lxdh lxdh_title">联系电话</span><span class="operation operation_title">操作</span>
                </div>
                <c:forEach items="${models}"  var="model"  varStatus="status">
                <c:if test="${model.isDefault==1}">
                <div class="aim_content_one aim_active">
                			<sapn id="id" hidden="hidden" value="${model.id}">${model.id}</sapn>
                    <span class="dzmc dzmc_active">${model.recvTag}</span>
                    <span class="dzxm dzxm_normal">${model.recvUsername}</span>
                    <span class="dzxq dzxq_normal">${model.recvDistrict}${model.recvAddress}</span>
                    <span class="lxdh lxdh_normal">${model.recvPhone}</span>
                                     <span class="operation operation_normal">
                    	<span class="aco_change" onclick="javascript:update(this,${model.id})">修改</span>|
                    	<span class="aco_delete" onclick="javascript:mydelete(this,${model.id})">删除</span>
                    </span>
                    <span class="swmr swmr_normal" onclick="javascript:setDefault(this,${model.id})"></span>
                
                </div>
                </c:if>
                <c:if test="${model.isDefault!=1}">
                <div class="aim_content_one ">
                	<sapn id="id" hidden="hidden" value="${model.id}">${model.id}</sapn>
                    <span class="dzmc dzmc_normal">${model.recvTag}</span>
                    <span class="dzxm dzxm_normal">${model.recvUsername}</span>
                    <span class="dzxq dzxq_normal">${model.recvDistrict}${model.recvAddress}</span>
                    <span class="lxdh lxdh_normal">${model.recvPhone}</span>
                                     <span class="operation operation_normal">
                    	 <span class="aco_change" onclick="javascript:update(this,${model.id})">修改</span>|
                    	<span class="aco_delete" onclick="javascript:mydelete(this,${model.id})">删除</span>
                    </span>
                   <span class="swmr swmr_normal"  onclick="javascript:setDefault(this,${model.id})">设为默认</span>
                </div>
                </c:if>
              </c:forEach>
<!--                 <div class="aim_content_three"> -->
<!--                     <span class="dzmc dzmc_normal">宿舍</span> -->
<!--                     <span class="dzxm dzxm_normal">杨洋</span> -->
<!--                     <span class="dzxq dzxq_normal">山西省小店区山西大学商务学院</span> -->
<!--                     <span class="lxdh lxdh_normal">13799992347</span> -->
<!--                     <span class="operation operation_normal"> -->
<!--                     	<span class="aco_change">修改</span>|<span class="aco_delete">删除</span> -->
<!--                     </span> -->
<!--                     <span class="swmr swmr_normal">设为默认</span> -->
<!--                 </div> -->
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/layout/foot.jsp" %>

</body>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/jquery.page.js"></script>
<script type="text/javascript" src="../js/orders.js"></script>
<script type="text/javascript" src="../js/distpicker.data.js"></script>
<script type="text/javascript" src="../js/distpicker.js"></script>
<script type="text/javascript" src="../js/personal.js"></script>
<script type="text/javascript">
// 	$(".lxdh_normal").each(function(i,e) {
// 		var phone = $(e).html();
// 		$(e).html(changePhone(phone));
// 	});
	
	$(function(){
		/**
		 * 提交表单时，校验必填项是否填写完整
		 */
		$(".save_recipient").click(function(){
			var receiverName = $("#receiverName").val();// 收件人
			var receiverState = $("#receiverState").val();// 省
			var receiverCity = $("#receiverCity").val();// 市
			var receiverDistrict = $("#receiverDistrict").val();// 区/县
			var receiverAddress = $("#receiverAddress").val();// 
			var receiverMobile = $("#receiverMobile").val();
			//必填项校验
			if(receiverName && receiverState && receiverCity && receiverDistrict && receiverAddress && receiverMobile){
				//格式校验
				if ($("#receiverName")[0].validity.toolong){
					$("#receiverName").after($("<span>收货人姓名长度小于50</span>").css("color","red"));
					return;
				}
				if($("#receiverAddress")[0].validity.toolong){
					$("#receiverAddress").after($("<span>地址长度小于50</span>").css("color","red"));
					return;
				}
				if($("#receiverMobile")[0].validity.patternMismatch){
					$("#receiverMobile").after($("<span>手机格式不正确</span>").css("color","red"))
					return;
				}
				if($("#receiverZip")[0].validity.patternMismatch){
					$("#receiverZip").after($("<span>邮编格式不正确</span>").css("color","red"))
					return;
				}
				if($("#btn_save_recipient").text()=="保存收货人信息"){
					addAddress();
					clearForm();
				}else if($("#btn_save_recipient").text()=="修改"){
					doupdate();
					clearForm();
					$("#btn_save_recipient").text("保存收货人信息");
				}
				
				
			}else{
				alert("请将必填信息填写完整");
			}
		})
		
		/**
		 * 地址设为默认点击事件
		 */
		 
// 		 $(".swmr_normal").click(function(){
// 				setDefault(this);
// 			}) 
	})
	

	//获取form中的数据
	function getData(){
		var address=new Object();
		address.id=$("#receiverId").val();
		address.recvUsername =$("#receiverName").val();
		address.recvProvinceCode =$("#receiverState [selected]").attr("data-code");
		address.recvCityCode=$("#receiverCity [selected]").attr("data-code");
		address.recvAreaCode=$("#receiverDistrict [selected]").attr("data-code");
		address.recvAddress=$("#receiverAddress").val();
		address.recvPhone =$("#receiverMobile").val();
		address.recvTel =$("#receiverPhone").val();
		address.recvZip = $("#receiverZip").val();
		address.recvTag =$("#addressName"	).val();
		return address;
	}
	
	//添加地址
	function addAddress(){
		var address=getData();
		$.ajax({
			url:"${basepath}/address/add.do",
			data:address,
			type:"post",
			dataType:"json",
			success:function(obj){
				if(obj.state==1){
					//后台插入成功后,再前台插入
					model=obj.data;
					$(".address_information_manage").append('<div class="aim_content_one ">'
		                	+'<sapn id="id" hidden="hidden">'+model.id+'</sapn>'
		                	+'<span class="dzmc dzmc_active">'+model.recvTag+'</span>'
		                	+'<span class="dzxm dzxm_normal">'+model.recvUsername+'</span>'
		                	+'<span class="dzxq dzxq_normal">'+model.recvDistrict + model.recvAddress+'</span>'
		                	+'<span class="lxdh lxdh_normal">'+model.recvPhone+'</span>'
		                	+'<span class="operation operation_normal">'
		                	+'<span class="aco_change" onclick="javascript:update(this,'+model.id+')">修改</span>|'
		                	+'<span class="aco_delete" onclick="javascript:mydelete(this,'+model.id+')">删除</span>'
		                	+'</span>'
		                	+'<span class="swmr swmr_normal"  onclick="javascript:setDefault(this,'+model.id+')">设为默认</span>'
		                	+'</div>');
				}else{
					alert(obj.message);
				}
			}
		})
	}
	
	/**
	更新
	*/
	function doupdate(){
		var address=getData();
		$.ajax({
			url:"${basepath}/address/update.do",
			data:address,
			type:"post",
			dataType:"json",
			success:function(obj){
				if(obj.state==1){
					model=obj.data;
					$(".address_information_manage #id[value='"+model.id+"']").parent().after('<div class="aim_content_one ">'
		                	+'<sapn id="id" hidden="hidden">'+model.id+'</sapn>'
		                	+'<span class="dzmc dzmc_active">'+model.recvTag+'</span>'
		                	+'<span class="dzxm dzxm_normal">'+model.recvUsername+'</span>'
		                	+'<span class="dzxq dzxq_normal">'+model.recvDistrict + model.recvAddress+'</span>'
		                	+'<span class="lxdh lxdh_normal">'+model.recvPhone+'</span>'
		                	+'<span class="operation operation_normal">'
		                	+'<span class="aco_change" onclick="javascript:update(this,'+model.id+')">修改</span>|'
		                	+'<span class="aco_delete" onclick="javascript:mydelete(this,'+model.id+')">删除</span>'
		                	+'</span>'
		                	+'<span class="swmr swmr_normal"  onclick="javascript:setDefault(this,'+model.id+')">设为默认</span>'
		                	+'</div>');
		                	
					$(".address_information_manage #id[value='"+model.id+"']").parent().remove();
				
				}else{
					alert(obj.message);
				}
			}
		})
		
	}
	
	//删除
	function mydelete(e,id){
		if(confirm("确定删除吗？")){
			dodelete(id);
		}
	}
	
	/**
	*删除请求
	*/
	function dodelete(id){

		$.ajax({
			url:"${basepath}/address/delete.do",
			data:"id="+id,
			type:"post",
			dataType:"json",
			success:function(obj){
				if(obj.state==1){
					$(".address_information_manage #id[value='"+id+"']").parent().remove();
				}else{
					alert(obj.message);
				}
			}
		})
		
	}
	
	
	
	
	
	//清除表内内容
	function clearForm(){
		$("#receiverName").val("");
		$("#receiverState option[data-code='']").attr("selected");
		$("#receiverCity option[data-code='']").attr("selected");
		$("#receiverDistrict option[data-code='']").attr("selected");
		$("#receiverAddress").val("");
		$("#receiverMobile").val("");
		$("#receiverPhone").val("");
		$("#receiverZip").val("");
		$("#addressName").val("");
	}
	
	
	/**
	 * 设置默认方法
	 * @param {Object} e
	 */
	function setDefault(e,id){
		var parent = $(e).parent();
		if((!$(parent).hasClass("aim_active"))&&id!=null){
			$.ajax({
				url:"${basepath}/address/setdefault.do",
				type:"post",
				data:"id="+id,
				dataType:"json",
				success:function(data){
					if(data.state==1){
						//data.message
						$(parent).siblings().removeClass("aim_active");
						$(parent).siblings().children(".dzmc_active").removeClass("dzmc_active").addClass("dzmc_normal");
						$(parent).siblings().children(".swmr_normal").html("设为默认");
						//$(parent).siblings().children(".swmr_normal").attr("onclick","javascript:setDefault("+$(parent).children("#id").text()+")");
						//$(this).removeAttr("onclick");
						$(parent).addClass("aim_active");
						$(parent).children(".dzmc_normal").removeClass("dzmc_normal").addClass("dzmc_active");
						$(e).html("");
						
					}else{
						alert(data.message);
						
					}
				}
			});
			
		
		}
	
	}
	 
	 /**
	 *更新载入数据
	 */
	 function  update(e,id){
		 //查询数据载入表格
		 //修改按钮方法为doupdate
		 $.ajax({
			 url:"${basepath}/address/findById.do",
			 data:"id="+id,
			 type:"post",
			 dataType:"json",
			 success:function(data){
				var model = data.data;
					$("#receiverId").val(model.id);
					$("#receiverName").val(model.recvUsername);
					$("#receiverState option[data-code='"+model.recvProvinceCode+"']").attr("selected","");
					$("#receiverCity option[data-code='"+model.recvCityCode+"']").attr("selected","");
					$("#receiverDistrict option[data-code='"+model.recvAreaCode+"']").attr("selected","");
					$("#receiverAddress").val(model.recvAddress);
					$("#receiverMobile").val(model.recvPhone);
					$("#receiverPhone").val(model.recvTel);
					$("#receiverZip").val(model.recvZip);
					$("#addressName").val(model.recvTag);
					$("#btn_save_recipient").text("修改");
			 }
		 })
	 }
	 
	 
	 
	 
		
	
	
	
</script>
</html>