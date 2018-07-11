package cn.tedu.store.bean;



import java.sql.Timestamp;

import javax.persistence.Id;
import javax.persistence.Table;


@Table(name="t_goods")
public class Goods {

	@Id
	private String id;
	private Long categoryId;
	private String itemType;
	private String title;
	private String sellPoint;
	private Long price;
	private Integer num;
	private String barcode;
	private String image;
	private Integer status;
	private Integer priority;
	private Timestamp createdTime;
	private Timestamp modifiedTime;
	private String createdUser;
	private String modifiedUser;



	public void setId(String id){
		this.id=id;
	}

	public String getId(){
		return id;
	}

	public void setCategoryId(Long categoryId){
		this.categoryId=categoryId;
	}

	public Long getCategoryId(){
		return categoryId;
	}

	public void setItemType(String itemType){
		this.itemType=itemType;
	}

	public String getItemType(){
		return itemType;
	}

	public void setTitle(String title){
		this.title=title;
	}

	public String getTitle(){
		return title;
	}

	public void setSellPoint(String sellPoint){
		this.sellPoint=sellPoint;
	}

	public String getSellPoint(){
		return sellPoint;
	}

	public void setPrice(Long price){
		this.price=price;
	}

	public Long getPrice(){
		return price;
	}

	public void setNum(Integer num){
		this.num=num;
	}

	public Integer getNum(){
		return num;
	}

	public void setBarcode(String barcode){
		this.barcode=barcode;
	}

	public String getBarcode(){
		return barcode;
	}

	public void setImage(String image){
		this.image=image;
	}

	public String getImage(){
		return image;
	}

	public void setStatus(Integer status){
		this.status=status;
	}

	public Integer getStatus(){
		return status;
	}

	public void setPriority(Integer priority){
		this.priority=priority;
	}

	public Integer getPriority(){
		return priority;
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