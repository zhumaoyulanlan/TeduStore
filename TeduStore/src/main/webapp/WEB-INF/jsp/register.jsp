<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>学子商城注册页面</title>
  <link href="${basepath}/css/header.css" rel="stylesheet"/>
  <link href="${basepath}/css/footer.css" rel="stylesheet"/>
  <link href="${basepath}/css/animate.css" rel="stylesheet"/>
  <link href="${basepath}/css/login.css" rel="stylesheet" />
</head>
<body>
<!-- 页面顶部-->
<header id="top">
  <div class="top">
    <img src="${basepath}/images/header/logo.png" alt=""/>
    <span>欢迎注册</span>
  </div>
</header>
<div class="parent">
  <!--<video src="audio/snow.mp4" width="100%" autoplay loop muted></video>-->
  <div class="container">
    <div class="panel rt">
      <form id="form-register" method="post" action="">
        <div class="txt">
          <p>新用户注册
            <span>
              <a href="${basepath}/user/login.do">直接登录</a>
            </span>
          </p>
        </div>
        <div class="form-group">
          <label for="uname">用户名：</label>
          <input autocomplete required minlength="6" maxlength="9" type="text" placeholder="请输入用户名" autofocus name="uname" id="uname"/>
          <span class="msg-default">用户名长度在6到9位之间</span>
        </div>
        <div class="form-group">
          <label for="upwd">登录密码：</label>
          <input required type="password" minlength="6" maxlength="12" placeholder="请输入密码" name="upwd" autofocus id="upwd"/>
          <span class="msg-default hidden">密码长度在6到12位之间</span>
        </div>
		 <div class="form-group">
          <label for="upwdconfirm">确认密码：</label>
          <input required type="password" minlength="6" maxlength="12" placeholder="请确认密码" name="upwdconfirm" autofocus id="upwdconfirm"/>
          <span class="msg-default hidden">密码长度在6到12位之间</span>
        </div>
        <div class="form-group">
          <label for="email">邮箱：</label>
          <input autocomplete required type="email" placeholder="请输入邮箱地址" name="email" id="email"  />
          <span class="msg-default hidden">请输入合法的邮箱地址</span>
        </div>
        <div class="form-group">
          <label for="phone">手机号：</label>
          <input id="phone" name="phone" placeholder="请输入您的手机号" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$" required type="text" />
          <span class="msg-default hidden">请输入合法的手机号</span>
        </div>
        <div class="form-group">
          <label></label>
          <input type="button" value="提交注册信息" id="bt-register"/>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- 页面底部-->
<%@include file="/WEB-INF/layout/foot.jsp" %>

<!--弹出的小广告-->
<script src="${basepath}/js/jquery-3.1.1.min.js"></script>
<script>
  $('#bt-register').click(function(){
    var lengths=0;
    $('.form-group').each(function(){
      if($(this).find('span').hasClass('msg-success')){
        lengths++;
      }
   if(lengths==4){
        $('.modal').fadeIn();
        setTimeout(function(){
          window.location.href='login.html';
        },2000);
      }
    });
  })
</script>
<script type="text/javascript" src="${basePath}/js/register/register.js">
	
</script>

<script>
//   /*1.对用户名进行验证*/
//   uname.onblur = function(){
//     if(this.validity.valueMissing){
//       this.nextElementSibling.innerHTML = '用户名不能为空';
//       this.nextElementSibling.className = 'msg-error';
//       this.setCustomValidity('用户名不能为空');
//     }else if(this.validity.tooShort){
//       this.nextElementSibling.innerHTML = '用户名不能少于6位';
//       this.nextElementSibling.className = 'msg-error';
//       this.setCustomValidity('用户名不能少于6位');
//     }else {
//       this.nextElementSibling.innerHTML = '用户名格式正确';
//       this.nextElementSibling.className = 'msg-success';
//       this.setCustomValidity('');
//       var data =document.getElementById("uname").value;
//       if(!data){   //用户没有输入任何内容
//         return;
//       }
//       /**发起异步GET请求，询问服务器用户名是否已经存在**/
//       //1 创建xhr
//       var xhr = new XMLHttpRequest();
//       console.log(xhr);
//       //2 监听状态改变 01234，4最有价值
//       xhr.onreadystatechange = function(){
//         if(xhr.readyState===4){//响应完成
//           if(xhr.status===200){
//             console.log('响应完成且成功');
//             doResponse(xhr);
//           }
//           else {
//             console.log('响应完成但有问题');
//           }
//         }
//       }
//       //3 打开连接
//       xhr.open('GET','/checkUsername.html?username='+data, true);
//       //4 发送请求
//       xhr.send(null);

//       //处理响应消息
//       function doResponse(xhr){
//         console.log('开始处理响应数据');
//         //console.log(xhr);
//         if(xhr.responseText==='yes'){
//           alert('该用户名已被占用');
//         }else if(xhr.responseText==='no'){
//           alert('该用户名可以使用');
//         }else {
//           alert(xhr.responseText);
//         	}
//      	}
//     }
//   }

//   uname.onfocus = function(){
//     this.nextElementSibling.innerHTML = '用户名长度在6到9位之间';
//     this.nextElementSibling.className = 'msg-default';
//   }
//   upwd.onfocus = function(){
//     this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
//     this.nextElementSibling.className = 'msg-default';
//   }
//   upwd.onblur = function(){
//     if(this.validity.valueMissing){
//       this.nextElementSibling.innerHTML = '密码不能为空';
//       this.nextElementSibling.className = 'msg-error';
//       this.setCustomValidity('密码不能为空');
//     }else if(this.validity.tooShort){
//       this.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
//       this.nextElementSibling.className = 'msg-error';
//       this.setCustomValidity('密码长度在尽量别少于6位');
//     }else {
//       this.nextElementSibling.innerHTML = '密码格式正确';
//       this.nextElementSibling.className = 'msg-success';
//       this.setCustomValidity('');
//     }
//   }
  

//   upwdconfirm.onfocus = function(){
//     this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
//     this.nextElementSibling.className = 'msg-default';
//   }
//   upwdconfirm.onblur = function(){
//     if(this.validity.valueMissing){
//       this.nextElementSibling.innerHTML = '密码不能为空';
//       this.nextElementSibling.className = 'msg-error';
//       this.setCustomValidity('密码不能为空');
//     }else if(this.validity.tooShort){
//       this.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
//       this.nextElementSibling.className = 'msg-error';
//       this.setCustomValidity('密码长度在尽量别少于6位');
//     }else {
//       this.nextElementSibling.innerHTML = '密码格式正确';
//       this.nextElementSibling.className = 'msg-success';
//       this.setCustomValidity('');
//     }
//   }
  
//   /*3.对邮箱地址进行验证*/
//   email.onblur = function(){
//     if(this.validity.valueMissing){
//       this.nextElementSibling.innerHTML = '邮箱不能为空';
//       this.nextElementSibling.className = 'msg-error';
//       this.setCustomValidity('邮箱不能为空');
//     }else if(this.validity.typeMismatch){
//       this.nextElementSibling.innerHTML = '邮箱格式不正确';
//       this.nextElementSibling.className = 'msg-error';
//       this.setCustomValidity('邮箱格式不正确');
//     }else {
//       this.nextElementSibling.innerHTML = '邮箱格式正确';
//       this.nextElementSibling.className = 'msg-success';
//       this.setCustomValidity('');

//       var data =document.getElementById("email").value;
//       if(!data){   //用户没有输入任何内容
//         return;
//       }
//       /**发起异步GET请求，询问服务器用户名是否已经存在**/
//       //1 创建xhr
//       var xhr = new XMLHttpRequest();
//       //2 监听状态改变 01234，4最有价值
//       xhr.onreadystatechange = function(){
//         if(xhr.readyState===4){//响应完成
//           if(xhr.status===200){
//             console.log('响应完成且成功');
//             doResponse(xhr);
//           }
//           else {
//             console.log('响应完成但有问题');
//           }
//         }
//       }
//       //3 打开连接
//       xhr.open('GET','/checkEmail.html?email='+data, true);
//       //4 发送请求
//       xhr.send(null);
//       //处理响应消息
//       function doResponse(xhr){
//         console.log('开始处理响应数据');
//         //console.log(xhr);
//         if(xhr.responseText==='yes'){
//           alert('该邮箱已被占用');
//         }else if(xhr.responseText==='no'){
//           alert('该邮箱可以使用');
//         }else {
//           alert(xhr.responseText);
//         }
//       }
//     }
//   }
//   email.onfocus = function(){
//     this.nextElementSibling.innerHTML = '请输入合法的邮箱地址';
//     this.nextElementSibling.className = 'msg-default';
//   }
//   /*3.对手机号进行验证*/
//   phone.onblur = function(){
//     if(this.validity.valueMissing){
//       this.nextElementSibling.innerHTML = '手机号不能为空';
//       this.nextElementSibling.className = 'msg-error';
//       this.setCustomValidity('手机号不能为空');
//     }else if(this.validity.patternMismatch){
//       this.nextElementSibling.innerHTML = '手机号格式不正确';
//       this.nextElementSibling.className = 'msg-error';
//       this.setCustomValidity('手机号格式不正确');
//     }else {
//       this.nextElementSibling.innerHTML = '手机号格式正确';
//       this.nextElementSibling.className = 'msg-success';
//       this.setCustomValidity('');

//       var data =document.getElementById("phone").value;
//       if(!data){   //用户没有输入任何内容
//         return;
//       }
//       /**发起异步GET请求，询问服务器用户名是否已经存在**/
//       //1 创建xhr
//       var xhr = new XMLHttpRequest();
//       //2 监听状态改变 01234，4最有价值
//       xhr.onreadystatechange = function(){
//         if(xhr.readyState===4){//响应完成
//           if(xhr.status===200){
//             console.log('响应完成且成功');
//             doResponse(xhr);
//           }
//           else{
//             console.log('响应完成但有问题');
//           }
//         }
//       }
//       //3 打开连接
//       xhr.open('GET','/checkPhone.html?phone='+data, true);
//       //4 发送请求
//       xhr.send(null);
//       //处理响应消息
//       function doResponse(xhr){
//         console.log('开始处理响应数据');
//         //console.log(xhr);
//         if(xhr.responseText==='yes'){
//           alert('该号码已被占用');
//         }else if(xhr.responseText==='no'){
//           alert('该号码可以使用');
//         }else {
//           alert(xhr.responseText);
//         }
//       }
//     }
//   }
//   phone.onfocus = function(){
//     this.nextElementSibling.innerHTML = '请输入合法的手机号';
//     this.nextElementSibling.className = 'msg-default';
//   }
</script>
</body>
</html>