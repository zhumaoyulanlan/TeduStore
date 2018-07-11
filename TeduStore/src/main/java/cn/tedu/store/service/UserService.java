package cn.tedu.store.service;

import org.springframework.stereotype.Service;

import cn.tedu.store.base.BaseService;
import cn.tedu.store.base.ResponseResult;
import cn.tedu.store.bean.User;

@Service
public interface UserService extends	BaseService<User> {
	public User findByName(String username);
	public int setUserName(User user);
	public int setPassWord(User user);
	public ResponseResult<User> register(User user);
	boolean EmailExisted(String email);
	boolean UsernameExisted(String username);
	public User login(String username, String password);
	public ResponseResult<User> changePassword(int id, String oldpassword, String newpassword, String repassword);
	public ResponseResult<User> update(User user);
}
