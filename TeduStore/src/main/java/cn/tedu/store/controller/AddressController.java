package cn.tedu.store.controller;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tedu.store.base.ResponseResult;
import cn.tedu.store.bean.Address;
import cn.tedu.store.service.AddressService;
import cn.tedu.store.util.ControllerUtil;

@Controller
@RequestMapping("/address")
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
	@RequestMapping("/list")
	public String address(ModelMap map,HttpSession session) {
		map.put("models", addressService.findAll(ControllerUtil.getCurrentUserID(session)));
		return "jsp/addressAdmin";
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public ResponseResult<Address> add(Address address ,HttpSession session) {
		ResponseResult<Address> responseResult =new ResponseResult<Address>();
		try{
			int uid =ControllerUtil.getCurrentUserID(session);
			Date date = new Date(new java.util.Date().getTime());
			address.setUid(uid);
			address.setModifiedTime(date);
			address.setCreateTime(date);
			addressService.add(address);
			responseResult.setState(1);
			responseResult.setMessage("添加成功");
			responseResult.setData(addressService.findById(address.getId()));
			return responseResult;
		}catch(RuntimeException e){
			e.printStackTrace();
			responseResult.setState(0);
			responseResult.setMessage("发生异常,添加失败");
			return responseResult;
		}
	}
	
	@PostMapping("/setdefault")
	@ResponseBody
	public ResponseResult<Void> setDefault(Integer id,HttpSession session) {
		ResponseResult<Void> responseResult =new ResponseResult<Void>();	
		int uid = ControllerUtil.getCurrentUserID(session);
		try {
			if(addressService.setDefault(id,uid)>0) {
				responseResult.setState(1);
				responseResult.setMessage("设置默认地址成功");
				return responseResult;
			}else {
				responseResult.setState(0);
				responseResult.setMessage("未知错误,设置失败");
				return responseResult;
			}
		}catch (RuntimeException e) {
			e.printStackTrace();
			responseResult.setState(0);
			responseResult.setMessage("发生异常,设置失败");
			return responseResult;
		}
	}
	
	@PostMapping("/update")
	@ResponseBody
	public ResponseResult<Address> update(Address address,HttpSession httpSession){
		ResponseResult<Address> responseResult =new ResponseResult<Address>();
		address.setUid(ControllerUtil.getCurrentUserID(httpSession));
		try {
			if(addressService.set(address)>0) {
				responseResult.setState(1);
				responseResult.setData(addressService.findById(address.getId()));
				responseResult.setMessage("修改成功");
				return responseResult;
			}
			responseResult.setState(0);
			responseResult.setMessage("修改失败");
			return responseResult;
		}catch (RuntimeException e) {
			e.printStackTrace();
			responseResult.setState(0);
			responseResult.setMessage("发生异常,修改失败");
			return responseResult;
		}
	}
	
	@PostMapping("/findById.do")
	@ResponseBody
	public ResponseResult<Address> findById(int id) {
		ResponseResult<Address> responseResult =new ResponseResult<Address>();
		try {
			Address address = addressService.findById(id);
			if(address!=null) {
				responseResult.setState(1);
				responseResult.setData(address);
				responseResult.setMessage("查询成功");
				return responseResult;
			}
			responseResult.setState(0);
			responseResult.setMessage("查询失败");
			return responseResult;
		}catch (RuntimeException e) {
			e.printStackTrace();
			responseResult.setState(0);
			responseResult.setMessage("发生异常,查询失败");
			return responseResult;
		}
	}
	
	@PostMapping("/delete.do")
	@ResponseBody
	public ResponseResult<Void> delete(Integer id){
		ResponseResult<Void> responseResult = new ResponseResult<Void>();
		try {
			int rs= addressService.del(id);
			if(rs>0) {
				responseResult.setState(1);
				responseResult.setMessage("删除成功");
				return responseResult;
			}
			responseResult.setState(0);
			responseResult.setMessage("删除失败");
			return responseResult;
		}catch (RuntimeException e) {
			e.printStackTrace();
			responseResult.setState(0);
			responseResult.setMessage("发生异常,删除失败");
			return responseResult;
		}
	}
	
	
	
}
