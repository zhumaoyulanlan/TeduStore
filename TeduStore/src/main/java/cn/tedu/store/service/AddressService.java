package cn.tedu.store.service;

import java.util.List;

import cn.tedu.store.bean.Address;

public interface AddressService {
	
	public List<Address> findAll(int uid);
//	public Address findById(int id ,int uid);
	
	public int add(Address bean);
	public int del(int id);
	public int set(Address bean);
	public List<Address> findByPage(int limit,int size);
	public int countPage(int pageSize);
	int setDefault(int id, int uid);
	Address findById(int id);
	
}
