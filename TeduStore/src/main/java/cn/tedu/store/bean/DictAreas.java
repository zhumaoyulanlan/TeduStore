package cn.tedu.store.bean;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="t_dict_areas")
public class DictAreas {

	@Id
	private Integer id;
	private String cityCode;
	private String areaCode;
	private String areaName;

	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return id;
	}

	public void setCityCode(String cityCode){
		this.cityCode=cityCode;
	}

	public String getCityCode(){
		return cityCode;
	}

	public void setAreaCode(String areaCode){
		this.areaCode=areaCode;
	}

	public String getAreaCode(){
		return areaCode;
	}

	public void setAreaName(String areaName){
		this.areaName=areaName;
	}

	public String getAreaName(){
		return areaName;
	}


}