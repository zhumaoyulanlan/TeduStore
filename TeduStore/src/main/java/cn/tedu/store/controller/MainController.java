package cn.tedu.store.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tedu.store.bean.GoodsCategory;
import cn.tedu.store.service.GoodsCategoryService;
import tk.mybatis.mapper.common.Mapper;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private GoodsCategoryService goodsCategoryService;
	
	@RequestMapping("/index.do")
	public String showIndex(ModelMap map,HttpServletRequest request) {
				//获取1F商品列表
		//List<GoodsCategory> GoodsCategoryAndChildenList= goodsCategoryService.
		 Map<GoodsCategory, Map<GoodsCategory,?>> GoodsCategorymap=goodsCategoryService.getRootAndChilden();
		 request.setAttribute("GoodsCategorymap", GoodsCategorymap);
		 //获取1F商品
		
		//获取2F商品列表
		
		return "jsp/index";
	}
}
