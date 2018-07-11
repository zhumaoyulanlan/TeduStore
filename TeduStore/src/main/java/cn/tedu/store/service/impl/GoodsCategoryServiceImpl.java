package cn.tedu.store.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.print.attribute.HashAttributeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tedu.store.base.BaseServiceImpl;
import cn.tedu.store.bean.GoodsCategory;
import cn.tedu.store.mapper.GoodsCategoryMapper;
import cn.tedu.store.service.GoodsCategoryService;

@Service
public class GoodsCategoryServiceImpl extends BaseServiceImpl<GoodsCategory> implements GoodsCategoryService {

	
	private GoodsCategoryMapper categoryMapper;
	
	@Autowired
	public GoodsCategoryServiceImpl(GoodsCategoryMapper categoryMapper) {
		super(categoryMapper);
		this.categoryMapper=categoryMapper;
	}

	@Override
	public Map<GoodsCategory, Map<GoodsCategory,?>> getRootAndChilden() {
		List<GoodsCategory> list = categoryMapper.selectByParentId(0);
		GoodsCategory category =categoryMapper.selectByPrimaryKey(1);
		LinkedHashMap<GoodsCategory, Map<GoodsCategory,?>> map= new LinkedHashMap<GoodsCategory, Map<GoodsCategory,?>>();
		
		List<Map<GoodsCategory, List<?>>> rs = new ArrayList<Map<GoodsCategory, List<?>>>();
		Boolean isWhile =true;
		LinkedHashMap<GoodsCategory, Map<GoodsCategory,?>> foreachmap=new LinkedHashMap<GoodsCategory, Map<GoodsCategory,?>>();

		isWhile=false;
		for (int i = 0; i < list.size(); i++) {
			//Map<GoodsCategory, List<?>> map = new HashMap<GoodsCategory, List<?>>();
			map.put(list.get(i), null);
			if(1==list.get(i).getIsParent()) {
				isWhile=true;
				foreachmap.put(list.get(i),null);
			}
		}
		while(isWhile) {
			isWhile=false;
			Iterator<Entry<GoodsCategory, Map<GoodsCategory,?>>> iterator =foreachmap.entrySet().iterator();
			while(iterator.hasNext()) {
				Entry<GoodsCategory, Map<GoodsCategory,?>> entry = iterator.next();
				List<GoodsCategory> list1 = categoryMapper.selectByParentId(entry.getKey().getId());
				LinkedHashMap<GoodsCategory, Map<GoodsCategory,?>> linkedHashMap =new LinkedHashMap<>();
				for (GoodsCategory goodsCategory : list1) {
					linkedHashMap.put(goodsCategory, null);
					if(goodsCategory.getIsParent()==1) {
						isWhile=true;
						foreachmap.put(goodsCategory, null);
					}
				}
				entry.setValue(linkedHashMap);
				foreachmap.remove(entry.getKey());
			}
		}
		
		return map;
	}

}
