package cn.tedu.store.service;

import java.util.List;
import java.util.Map;

import cn.tedu.store.base.BaseService;
import cn.tedu.store.bean.GoodsCategory;

public interface GoodsCategoryService extends BaseService<GoodsCategory> {

	Map<GoodsCategory, Map<GoodsCategory,?>> getRootAndChilden();
	
}
