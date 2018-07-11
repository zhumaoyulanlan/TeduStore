package cn.tedu.store.mapper;

import java.sql.Timestamp;
import java.util.List;


import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;

import cn.tedu.store.base.BaseMapper;
import cn.tedu.store.bean.GoodsCategory;

public interface GoodsCategoryMapper extends BaseMapper<GoodsCategory> {
	@Results( value= { 
			@Result(property = "id", column = "id", id = true),
			@Result(property = "parentId", column = "parentId"),
			@Result(property = "name", column = "name"),
			@Result(property = "status", column = "status"),
			@Result(property = "sortOrder", column = "sort_order"),
			@Result(property = "isParent", column = "is_parent"),
			@Result(property = "createdTime", column = "created_time"),
			@Result(property = "modifiedTime", column = "modified_time"),
			@Result(property = "createdUser", column = "created_user"),
			@Result(property = "modifiedUser", column = "modified_user"),
	})
	@Select("select * from t_goods_category where parent_id = #{parentId}")
	List<GoodsCategory> selectByParentId(long parentId);
	
} 
