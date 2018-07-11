package cn.tedu.store.bean;

import javax.persistence.Id;
import javax.persistence.Table;

import com.lanlan.annotation.ID;
import com.lanlan.annotation.TableName;

@Table(name="t_dict_provinces")
public class DictProvinces {

	@Id
	private Integer id;
	private String provinceCode;
	private String provinceName;

	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return id;
	}

	public void setProvinceCode(String provinceCode){
		this.provinceCode=provinceCode;
	}

	public String getProvinceCode(){
		return provinceCode;
	}

	public void setProvinceName(String provinceName){
		this.provinceName=provinceName;
	}

	public String getProvinceName(){
		return provinceName;
	}


}