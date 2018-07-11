package cn.tedu.store.mapper;

import java.util.List;

import cn.tedu.store.base.BaseMapper;
import cn.tedu.store.bean.User;

public interface UserMapper extends BaseMapper<User> {
	public User selectByName(String username);
	public int updateUserName(User user);
	public int updatePassWord(User user);
	public List<User> selectByEmail(String email);
	int delete(int id) ;
	int update(User bean);
	User selectById(int id);
	
}
