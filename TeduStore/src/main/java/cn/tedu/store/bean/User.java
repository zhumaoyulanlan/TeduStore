package cn.tedu.store.bean;

import com.lanlan.annotation.ID;
import com.lanlan.annotation.TableName;

import java.sql.Date;


@TableName("t_user")
public class User {

	@ID
	private Integer id;
	private String username;
	private String password;
	private String email;
	private String phone;
	private String image;
	private Integer gender;
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

	public void setUsername(String username){
		this.username=username;
	}

	public String getUsername(){
		return username;
	}

	public void setPassword(String password){
		this.password=password;
	}

	public String getPassword(){
		return password;
	}

	public void setEmail(String email){
		this.email=email;
	}

	public String getEmail(){
		return email;
	}

	public void setPhone(String phone){
		this.phone=phone;
	}

	public String getPhone(){
		return phone;
	}

	public void setImage(String image){
		this.image=image;
	}

	public String getImage(){
		return image;
	}

	public void setGender(Integer gender){
		this.gender=gender;
	}

	public Integer getGender(){
		return gender;
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