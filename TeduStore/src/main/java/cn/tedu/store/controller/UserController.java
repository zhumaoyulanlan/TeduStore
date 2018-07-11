package cn.tedu.store.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tedu.store.base.ResponseResult;
import cn.tedu.store.bean.User;
import cn.tedu.store.service.UserService;
import cn.tedu.store.util.ControllerUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	
	
	/**
	 * 用户名重复检查
	 * @param username
	 * @return
	 */
	@RequestMapping("/checkName.do")
	@ResponseBody
	public ResponseResult<Object> checkName(String username) {
		ResponseResult<Object> responseResult = new ResponseResult<Object>();
		if(username!=null) {
			if(userService.UsernameExisted(username)) {
				responseResult.setState(0);
				responseResult.setMessage("用户名已存在");
			}else {
				responseResult.setState(1);
				responseResult.setMessage("用户名可以使用");
			}
		}
		else {
			responseResult.setState(0);
			responseResult.setMessage("用户名检查失败");
		}
		return responseResult;
	}
	/**
	 * 邮箱重复检查
	 * @param username
	 * @return
	 */
	@RequestMapping("/checkEmail.do")
	@ResponseBody
	public ResponseResult<Object> checkEmail(String username) {
		ResponseResult<Object> responseResult = new ResponseResult<Object>();
		if(username!=null) {
			if(userService.UsernameExisted(username)) {
				responseResult.setState(0);
				responseResult.setMessage("邮箱已存在");
			}else {
				responseResult.setState(1);
				responseResult.setMessage("邮箱可以使用");
			}
		}
		else {
			responseResult.setState(0);
			responseResult.setMessage("邮箱检查失败");
		}
		return responseResult;
	}
	
	/**
	 * 跳转注册页
	 * @return
	 */
	@GetMapping("/register.do")
	public String toRegister() {
		return "jsp/register";
	}
	
	/**
	 * 跳转登录页
	 * @return
	 */
	@GetMapping("/login.do")
	public String toLogin() {
		return "jsp/login";
	}
	
	/**
	 * 登录
	 * @param request
	 * @param username
	 * @param password
	 * @return
	 */
	@PostMapping("/login.do")
	@ResponseBody
	public ResponseResult<Object> login(HttpServletRequest request, String username ,String password){
		ResponseResult<Object> responseResult = new ResponseResult<Object>();
		if(username!=null&&password!=null) {
			User user = userService.login(username,password);
			if (user!=null) {
				request.getSession().setAttribute("currentUser",user );
				responseResult.setState(1);
				responseResult.setMessage("登录成功");
				return responseResult;
			}else {
				responseResult.setState(0);
				responseResult.setMessage("用户名或密码不正确");
				return responseResult;
			}
		}
		responseResult.setState(0);
		responseResult.setMessage("用户名或密码不能为空");
		return responseResult;
	}

	/**
	 * 注销
	 * @param session
	 * @return
	 */
	@RequestMapping("/exit.do")
	@ResponseBody
	public ResponseResult<Void> exit(HttpSession session){
		ResponseResult<Void> responseResult = new ResponseResult<Void>();
		if(session!=null) {
			session.invalidate();
			responseResult.setState(1);
			responseResult.setMessage("注销成功");
			return responseResult;
		}
		responseResult.setState(0);
		return responseResult;
	}
	
	/**
	 *  注册
	 * @param request
	 * @param username
	 * @param password
	 * @param repassword
	 * @param email
	 * @param phone
	 * @return
	 */
	@RequestMapping("/register.do")
	@ResponseBody
	public ResponseResult<User> register(HttpServletRequest request,
			@RequestParam(name="uname")  String username ,
			@RequestParam(name="upwd") String password,
			@RequestParam(name="upwdconfirm") String repassword,
			@RequestParam(name="email") String email,
			@RequestParam(name="phone") String phone ){
	
		//重复密码校验
		User user =new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setPhone(phone);
		return userService.register(user);
	}
	
	/**
	 * 修改密码
	 * @param session
	 * @param oldpassword
	 * @param newpassword
	 * @param repassword
	 * @return
	 */
	@RequestMapping("/changePassword.do")
	@ResponseBody
	public ResponseResult<User> changePassword(HttpSession session ,String oldpassword,String newpassword ,String repassword){
		int id = ControllerUtil.getCurrentUserID(session);
		return userService.changePassword(id, oldpassword, newpassword, repassword);
	}
	
	/**
	 * 修改用户信息
	 * @param session
	 * @param username
	 * @param email
	 * @param phone
	 * @param gender
	 * @return
	 */
	@RequestMapping("/update.do")
	@ResponseBody
	public ResponseResult<User> update(HttpSession session ,String username,String email,String phone,Integer gender){
		User user = new User();
		user.setId(ControllerUtil.getCurrentUserID(session));
		user.setUsername(username);
		user.setEmail(email);
		user.setPhone(phone);
		user.setGender(gender);
		ResponseResult<User> rr = userService.update(user);
		if(rr.getState()==1) {
			session.setAttribute("currentUser", rr.getData());
		}
		return rr;
	}
	
	
	/**
	 * 上传头像
	 * @param img
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/uploadImage.do")
	@ResponseBody
	public ResponseResult<String> uploadImage(String img,HttpServletRequest request ,HttpSession session){
		//System.out.println(img);
		ResponseResult<String> rr = new ResponseResult<String>();
		Base64.Decoder decoder = Base64.getDecoder();
		String fileName =new SimpleDateFormat("yyyy_MM_dd").format(new Date())+"_"+new GregorianCalendar().getTimeInMillis()+".png";
		String path=request.getServletContext().getRealPath("/uploadImage");
		File file = new File(path+"/"+fileName);
		File filePath= new File(path);
		filePath.mkdirs();
		try {
			if(!file.exists()) {
				file.createNewFile();
			}
			// Base64解码
			byte[] b = decoder.decode(img.substring(img.indexOf(",")+1, img.length()));
			try(OutputStream out = new FileOutputStream(file)){
				out.write(b);
				out.flush();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		User user = (User) session.getAttribute("currentUser");
		user.setImage("/uploadImage/"+fileName);
		userService.set(user);
		session.setAttribute("currentUser", user);
		rr.setState(1);
		rr.setMessage("图片修改成功");
		return rr;
	}
	
	/**
	 * 个人信息页
	 * @return
	 */
	@RequestMapping("/personage.do")
	public String personage() {
		return "jsp/personage";
	}
	
	@RequestMapping("/personal_password")
	public String personalPassword() {
		return "jsp/personal_password";
	}
	
	
	
	
}
