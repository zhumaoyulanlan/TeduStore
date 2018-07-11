package cn.tedu.store.base;

import java.util.List;

import org.springframework.stereotype.Service;





public class BaseServiceImpl<T> implements BaseService<T>{

	BaseMapper<T> baseMapper;
	
	public BaseServiceImpl(BaseMapper<T> baseMapper)
	{
		this.baseMapper=baseMapper;
	}
	
	@Override
	public int add(T bean) {
		return baseMapper.insert(bean);
	}

	@Override
	public int del(int id) {

		return baseMapper.delete(id);
	}

	@Override
	public int set(T bean) {
		return baseMapper.update(bean);
	}

	@Override
	public List<T> findAll() {
		
		return baseMapper.selectAll();
	}

	@Override
	public T findById(int id) {
		return baseMapper.selectById(id);
	}

	@Override
	public List<T> findByPage(int index, int size) {
		int limit=0;
		if(index<1) {
			limit=0;
		}else
		{
			limit=(index-1)*size;
		}
		return baseMapper.selectByPage(limit, size);
	}
	
	@Override
	public int countPage(int pageSize){
		int count = baseMapper.countRecord();
		if(count<1) {
			return 1;
		}
		if(pageSize<1) {
			return 0;
		}
		return (count-1)/pageSize+1;
	}

}
