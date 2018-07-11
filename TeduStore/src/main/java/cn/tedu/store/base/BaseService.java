package cn.tedu.store.base;

import java.util.List;

public interface BaseService<T> {
	public int add(T bean);
	public int del(int id);
	public int set(T bean);
	public List<T> findAll();
	public T findById(int id);
	public List<T> findByPage(int limit,int size);
	public int countPage(int pageSize);
}
