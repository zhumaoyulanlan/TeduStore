$(document).ready(function(){
	var pathName=window.document.location.pathname;
	var basepath=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
		//用户名失去焦点验证
		$("#uname").get(0).onblur=function(){
			if(this.validity.valueMissing){
				this.nextElementSibling.innerHTML = '用户名不能为空';
		    	this.nextElementSibling.className = 'msg-error';
		    	this.setCustomValidity('用户名不能为空');
			} else if(this.validity.tooShort){
				this.nextElementSibling.innerHTML = '用户名长度在6到9位之间';
		    	this.nextElementSibling.className = 'msg-error';
		    	this.setCustomValidity('用户名长度在6到9位之间');
			}else if(this.validity.tooLong){
				this.nextElementSibling.innerHTML = '用户名长度在6到9位之间';
		    	this.nextElementSibling.className = 'msg-error';
		    	this.setCustomValidity('用户名长度在6到9位之间');
			}else{
				jQuery.ajax({
					url:basepath+"/user/checkName.do",
					type:"post",
					data:"username="+$("#uname").val(),
					dataType:"json",
					success: function(data){
						if(data.state==1){
							$("#uname").next().text(data.message);
							$("#uname").next().removeClass('msg-error');
							$("#uname").next().addClass('msg-success');
						}else if(data.state==0){
							$("#uname").next().text(data.message);
							$("#uname").next().removeClass('msg-success');
							$("#uname").next().addClass('msg-error');
						}
					}
				})
			}
		};
		
		$("#uname").focus(function(){
		     this.nextElementSibling.innerHTML = '用户名长度在6到9位之间';
		     this.nextElementSibling.className = 'msg-default';
		})
		
		$("#upwd").get(0).onblur=function(){
			if(this.validity.valueMissing){
		       this.nextElementSibling.innerHTML = '密码不能为空';
		       this.nextElementSibling.className = 'msg-error';
		       this.setCustomValidity('密码不能为空');
		     }else if(this.validity.tooShort){
		       this.nextElementSibling.innerHTML = '密码长度在尽量别少于6位';
		       this.nextElementSibling.className = 'msg-error';
		       this.setCustomValidity('密码长度在尽量别少于6位');
		     } else{
		         this.nextElementSibling.innerHTML = '密码格式正确';
		         this.nextElementSibling.className = 'msg-success';
		         this.setCustomValidity('');
//		    	 $.ajax({
//		    		 url:"${basepath}/user/checkPwd.do",
//		    		 type:"post",
//		    		 data:"password="+$("#upwd").val(),
//		         dateType:"json",
//		    		 succeess:function(data){
//		    			 if(data.state==1){
//		    				 $("#upwd").next().text(data.message);
//		    				 $("#upwd").next().removeClass("msg-error");	
//		    				 $("#upwd").next().addClass("msg-success");
//		    				 $("#upwd").next().removeClass("msg-default");
//		    			 	}else if(data.state==0){
//		    			 		$("#upwd").next().text(data.message);
//		    			 		$("#upwd").next().addClass("msg-error");	
//			    				$("#upwd").next().removeClass("msg-success");
//			    				$("#upwd").next().removeClass("msg-default");
//		    			 	}
//		    		 }
//		    		 
//		    	 });
		     }
		}
		
		
		$("#email").get(0).onblur = function(){
		     if(this.validity.valueMissing){
	       this.nextElementSibling.innerHTML = '邮箱不能为空';
	       this.nextElementSibling.className = 'msg-error';
	       this.setCustomValidity('邮箱不能为空');
	     }else if(this.validity.typeMismatch){
	       this.nextElementSibling.innerHTML = '邮箱格式不正确';
	       this.nextElementSibling.className = 'msg-error';
	       this.setCustomValidity('邮箱格式不正确');
	     }else {
	    	 $.ajax({
	    		url:basepath+"/user/checkEmail",
	    		type:"post",
	    		data:"email="+$("#email").val(),
	    		dateType:"json",
	    		success:function(data){
	    			if(data.state==1){
	    				$("#email").next().text(data.message);
				 			$("#email").next().addClass("msg-error");	
	    				$("#email").next().removeClass("msg-success");
	    				$("#email").next().removeClass("msg-default");
	    				
	    			}else if(data.state==0){
    			 		$("#email").next().text(data.message);
    			 		$("#email").next().addClass("msg-error");	
	    				$("#email").next().removeClass("msg-success");
	    				$("#email").next().removeClass("msg-default");
    			 		}
	    		}
	    	 })
	    	 
	       this.nextElementSibling.innerHTML = '邮箱格式正确';
	       this.nextElementSibling.className = 'msg-success';
	       this.setCustomValidity('');
	       var data =document.getElementById("email").value;
	     		}
	       };


$("#bt-register").click(function(){
	$.ajax({
		url:basepath+"/user/register.do",
		data:$("#form-register").serialize(),
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.state==0){
				$("#unamespan").html(data.message);
				$("#unamespan").css("class","msg-error");
			}else if(data.state==1){
				//$("")
			}
		}
	})
})
	
});


	
