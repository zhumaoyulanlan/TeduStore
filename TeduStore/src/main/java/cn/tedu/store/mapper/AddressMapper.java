package cn.tedu.store.mapper;


import java.util.List;

import cn.tedu.store.bean.Address;
import tk.mybatis.mapper.common.Mapper;

public interface AddressMapper extends Mapper<Address>{
	public int insert(Address address);
	public List<Address> selectByUid(int uid);
	public Address selectById(int id);
	public int setAllNoDefault(int uid);
	public int setDefault(int id);
}


                    