package cn.tedu.store.bean;


import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="t_address")
public class Address  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -685973671695565117L;
	
	@Id
	private Integer id;
	private Integer uid;
	private String recvUsername;
	@Column(name="recv_provinceCode")
	private String recvProvinceCode;
	@Column(name="recv_cityCode")
	private String recvCityCode;
	@Column(name="recv_areaCode")
	private String recvAreaCode;
	private String recvAddress;
	private String recvDistrict;
	private String recvPhone;
	private String recvTel;
	private String recvZip;
	private String recvTag;
	private Integer isDefault;
	private String createUser;
	private Date createTime;
	private String modifiedUser;
	private Date modifiedTime;


	public void setId(Integer id){
		this.id=id;
	}

	public Integer getId(){
		return id;
	}

	public void setUid(Integer uid){
		this.uid=uid;
	}

	public Integer getUid(){
		return uid;
	}

	public void setRecvUsername(String recvUsername){
		this.recvUsername=recvUsername;
	}

	public String getRecvUsername(){
		return recvUsername;
	}

	public void setRecvProvinceCode(String recvProvinceCode){
		this.recvProvinceCode=recvProvinceCode;
	}

	public String getRecvProvinceCode(){
		return recvProvinceCode;
	}

	public void setRecvCityCode(String recvCityCode){
		this.recvCityCode=recvCityCode;
	}

	public String getRecvCityCode(){
		return recvCityCode;
	}

	public void setRecvAreaCode(String recvAreaCode){
		this.recvAreaCode=recvAreaCode;
	}

	public String getRecvAreaCode(){
		return recvAreaCode;
	}

	public void setRecvAddress(String recvAddress){
		this.recvAddress=recvAddress;
	}

	public String getRecvAddress(){
		return recvAddress;
	}

	public void setRecvDistrict(String recvDistrict){
		this.recvDistrict=recvDistrict;
	}

	public String getRecvDistrict(){
		return recvDistrict;
	}

	public void setRecvPhone(String recvPhone){
		this.recvPhone=recvPhone;
	}

	public String getRecvPhone(){
		return recvPhone;
	}

	public void setRecvTel(String recvTel){
		this.recvTel=recvTel;
	}

	public String getRecvTel(){
		return recvTel;
	}

	public void setRecvZip(String recvZip){
		this.recvZip=recvZip;
	}

	public String getRecvZip(){
		return recvZip;
	}

	public void setRecvTag(String recvTag){
		this.recvTag=recvTag;
	}

	public String getRecvTag(){
		return recvTag;
	}

	public void setIsDefault(Integer isDefault){
		this.isDefault=isDefault;
	}

	public Integer getIsDefault(){
		return isDefault;
	}

	public void setCreateUser(String createUser){
		this.createUser=createUser;
	}

	public String getCreateUser(){
		return createUser;
	}

	public void setCreateTime(Date createTime){
		this.createTime=createTime;
	}

	public Date getCreateTime(){
		return createTime;
	}

	public void setModifiedUser(String modifiedUser){
		this.modifiedUser=modifiedUser;
	}

	public String getModifiedUser(){
		return modifiedUser;
	}

	public void setModifiedTime(Date modifiedTime){
		this.modifiedTime=modifiedTime;
	}

	public Date getModifiedTime(){
		return modifiedTime;
	}


}