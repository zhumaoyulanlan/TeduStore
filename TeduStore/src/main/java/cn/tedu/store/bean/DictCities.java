package cn.tedu.store.bean;

import javax.persistence.Id;
import javax.persistence.Table;


@Table(name="t_dict_cities")
public class DictCities {

	@Id
	private Integer id;
	private String provinceCode;
	private String cityCode;
	private String cityName;



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

	public void setCityCode(String cityCode){
		this.cityCode=cityCode;
	}

	public String getCityCode(){
		return cityCode;
	}

	public void setCityName(String cityName){
		this.cityName=cityName;
	}

	public String getCityName(){
		return cityName;
	}


}