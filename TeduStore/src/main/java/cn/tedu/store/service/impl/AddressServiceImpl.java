package cn.tedu.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.tedu.store.base.BaseServiceImpl;
import cn.tedu.store.bean.Address;
import cn.tedu.store.mapper.AddressMapper;
import cn.tedu.store.service.AddressService;

@Service
public class AddressServiceImpl  implements AddressService {

	@Autowired
	private AddressMapper addressMapper;

	
	public List<Address> findAll(int uid){
		return addressMapper.selectByUid(uid);
	}
	@Override
	public Address findById(int id ) {
		return addressMapper.selectById(id);
	}

	@Override
	public int add(Address bean) {
		bean.setIsDefault(1);
		return addressMapper.insert(bean);
	}

	@Override
	public int del(int id) {
		return addressMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int set(Address bean) {
		return addressMapper.updateByPrimaryKeySelective(bean);
	}

	@Override
	public List<Address> findByPage(int limit, int size) {
		//return addressMapper.selectByRowBounds(arg0, arg1)
		return null;
	}

	@Override
	public int countPage(int pageSize) {
		return 0;
	}
	@Override
	public int setDefault(int id ,int uid) {
		int rs=addressMapper.setAllNoDefault(uid);
		int rs2=addressMapper.setDefault(id);
		if(rs>0&&rs2>0) {
			return 1;
		}else {
			return -1;
		}
	}
	
	
	
	
	

}
