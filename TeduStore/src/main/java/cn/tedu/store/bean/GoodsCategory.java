package cn.tedu.store.bean;



import java.sql.Timestamp;

import javax.persistence.Id;
import javax.persistence.Table;



@Table(name="t_goods_category")
public class GoodsCategory {

	@Id
	private Long id;
	private Long parentId;
	private String name;
	private Integer status;
	private Integer sortOrder;
	private Integer isParent;
	private Timestamp createdTime;
	private Timestamp modifiedTime;
	private String createdUser;
	private String modifiedUser;



	public void setId(Long id){
		this.id=id;
	}

	public Long getId(){
		return id;
	}

	public void setParentId(Long parentId){
		this.parentId=parentId;
	}

	public Long getParentId(){
		return parentId;
	}

	public void setName(String name){
		this.name=name;
	}

	public String getName(){
		return name;
	}

	public void setStatus(Integer status){
		this.status=status;
	}

	public Integer getStatus(){
		return status;
	}

	public void setSortOrder(Integer sortOrder){
		this.sortOrder=sortOrder;
	}

	public Integer getSortOrder(){
		return sortOrder;
	}

	public void setIsParent(Integer isParent){
		this.isParent=isParent;
	}

	public Integer getIsParent(){
		return isParent;
	}

	public void setCreatedTime(Timestamp createdTime){
		this.createdTime=createdTime;
	}

	public Timestamp getCreatedTime(){
		return createdTime;
	}

	public void setModifiedTime(Timestamp modifiedTime){
		this.modifiedTime=modifiedTime;
	}

	public Timestamp getModifiedTime(){
		return modifiedTime;
	}

	public void setCreatedUser(String createdUser){
		this.createdUser=createdUser;
	}

	public String getCreatedUser(){
		return createdUser;
	}

	public void setModifiedUser(String modifiedUser){
		this.modifiedUser=modifiedUser;
	}

	public String getModifiedUser(){
		return modifiedUser;
	}


}