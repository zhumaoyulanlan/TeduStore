package cn.tedu.store.service.impl;

import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.xml.crypto.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.store.base.BaseServiceImpl;
import cn.tedu.store.base.ResponseResult;
import cn.tedu.store.bean.User;
import cn.tedu.store.mapper.UserMapper;
import cn.tedu.store.service.UserService;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{
	

	private UserMapper userMapper;
	
	@Autowired           
	public UserServiceImpl(UserMapper userMapper) {
		super(userMapper);
		this.userMapper=userMapper;
	}
	@Override
	public User findByName(String username){
		return userMapper.selectByName(username);
	}
	@Override
	public int setUserName(User user) {
		return userMapper.update(user);
	}
	@Override
	public int setPassWord(User user) {
		return userMapper.updatePassWord(user);
	}
	@Override
	public boolean UsernameExisted(String username) {
		return userMapper.selectByName(username)!=null;
	}
	@Override
	public boolean EmailExisted(String email) {
		return userMapper.selectByEmail(email).size()>0;
	}
	
	
	/**
	 * 注册
	 */
	@Override
	public ResponseResult<User> register(User user) {
		ResponseResult<User> rr = new ResponseResult<User>();
		//格式验证
		if(!isNameValid(user.getPassword())) {
			rr.setState(0);
			rr.setMessage("用户名格式不正确");
			return rr;
		}
		if(!isPasswordValid(user.getPassword())) {
			rr.setState(0);
			rr.setMessage("密码格式不正确");
			return rr;
		}
		if(!isEmailValid(user.getPassword())) {
			rr.setState(0);
			rr.setMessage("邮箱格式不正确");
			return rr;
		}
		if(!isPhoneValid(user.getPassword())) {
			rr.setState(0);
			rr.setMessage("手机号码格式不正确");
			return rr;
		}

		//用户名存在检查
		if(UsernameExisted(user.getUsername())){
			rr.setState(0);
			rr.setMessage("注册失败,用户已存在");
			return rr;
		}
		
		//插入只注册信息
		user.setModifiedTime(new Date(new GregorianCalendar().getTimeInMillis()));
		user.setCreateTime(new Date(new GregorianCalendar().getTimeInMillis()));
		try {
			if(userMapper.insert(user)>0)
			{
				rr.setState(1);
				rr.setMessage("注册成功");
				rr.setData(user);
				return rr;
			}else {
				rr.setState(0);
				rr.setMessage("未知原因,注册失败");
				return rr;
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			rr.setMessage("发生异常,注册失败");
			return rr;
		}
	
	}
	
	/**
	 * 登录
	 */
	@Override
	public User login(String username, String password) {
		User user = userMapper.selectByName(username);
		if(user!=null) {
			if(user.getPassword().equals(password)) {
				return user;
			}else {
				return null;
			}
		}
		return null;
	}
	
	@Override
	public ResponseResult<User> changePassword(int id ,String oldpassword ,String newpassword,String repassword){
		ResponseResult<User> rr= new ResponseResult<User>();
		User user = userMapper.selectById(id);
		
		//密码校验
		if(!user.getPassword().equals(oldpassword)) {
			rr.setState(0);
			rr.setMessage("原密码错误");
			return rr;
		}
		if(!isPasswordValid(newpassword)) {
			rr.setState(0);
			rr.setMessage("密码不符合规则");
			return rr;
		}
		if(!newpassword.equals(repassword)) {
			rr.setState(0);
			rr.setMessage("两次密码不一致");
			return rr;
		}
		
		//密码修改
		user.setPassword(newpassword);
		user.setModifiedTime(new Date(new GregorianCalendar().getTimeInMillis()));
		try {
			if(userMapper.update(user)>0) {
				rr.setState(1);
				rr.setMessage("修改成功");
				return rr;
			}else {
				rr.setState(0);
				rr.setMessage("未知错误,修改失败");
				return rr;
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			rr.setState(0);
			rr.setMessage("发生异常,修改失败");
			return rr;
		}
	}
	
	/**
	 * 更新用户信息
	 */
	@Override
	public ResponseResult<User> update(User user) {
		ResponseResult<User> rr= new ResponseResult<User>();
		User selectuser =userMapper.selectById(user.getId());
		//用户已修改
		if(!user.getUsername().equals(selectuser.getUsername())) {
			if(UsernameExisted(user.getUsername())) {
				rr.setState(0);
				rr.setMessage("用户名已存在,修改失败");
				return rr;
			}
		}else {
			//user.setUsername(null);
		}
		
		//修改
		user.setModifiedTime(new Date(new java.util.Date().getTime()));
		try {
			if(userMapper.update(user)>0) {
				rr.setState(1);
				rr.setMessage("修改成功");
				rr.setData(userMapper.selectById(user.getId()));
				return rr;
			}else {
				rr.setState(0);
				rr.setMessage("未知异常,修改失败");
				return rr;
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			rr.setState(0);
			rr.setMessage("程序异常,修改失败");
			return rr;
		}
		
	}
	
	
	
	
	//===============================以下为注册修改格式验证方法==================
	
	/**
	 * 密码格式校验
	 * @param password
	 * @return
	 */
	private boolean isPasswordValid(String password) {
		String patten = "^.{6,12}$";
		if(password!=null) {
			return password.matches(patten);
		}
		return false;
	}
	
	/**
	 * 邮箱格式验证
	 * @param email
	 * @return
	 */
	private boolean isEmailValid(String email) {
		String patten ="^.+@.*(\\..*)*$";
		if(email!=null) {
			return email.matches(patten);
		}
		return false;
	}
	
	/**
	 * 手机号码格式验证
	 * @param phone
	 * @return
	 */
	private boolean isPhoneValid(String phone) {
		String patten="(^\\d{11}$)|^((\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})|(\\d{4}|\\d{3})-(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1})|(\\d{7,8})-(\\d{4}|\\d{3}|\\d{2}|\\d{1}))$";
		if(phone!=null) {
			return phone.matches(patten);
		}
		return false;
	}
	
	/**
	 * 用户名格式验证
	 * @param name
	 * @return
	 */
	private boolean isNameValid(String name) {
		String patten="^.{6,12}$";
		if(name!=null) {
			return name.matches(patten);
		}
		return false;
	}

	
}
