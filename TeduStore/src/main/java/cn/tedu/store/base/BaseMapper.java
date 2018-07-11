package cn.tedu.store.base;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

public interface BaseMapper<T> extends Mapper<T> {
	public int insert(T bean);
	public int delete(int id);
	public int update(T bean);
	public List<T> selectAll();
	public T selectById(int id);
	public int countRecord();
	public List<T> selectByPage(int limit,int size);
}
