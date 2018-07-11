desc t_user;

select * from t_user;

update t_user set username="aaa";

show tables;


ChineseDistricts

select * from t_dict_provinces

select * from t_address
delete from t_address

desc t_address

select
 t_address.id id,              
 uid,                
 recv_username,       
 recv_provinceCode,   
 recv_cityCode,       
 recv_areaCode,
 CONCAT(province_name,city_name,area_name) recv_district, 
 recv_address,         
 recv_phone,           
 recv_tel,           
 recv_zip,           
 recv_tag,           
 is_default,         
 create_user,        
 create_time,        
 modified_user,    
 modified_time
 from
 t_address 
 left join 
 t_dict_provinces 
 	on t_address.recv_provinceCode=t_dict_provinces.province_code
 left join 
 	t_dict_cities
 on
  t_address.recv_cityCode=t_dict_cities.city_code
 left join
 	 t_dict_areas
 	 on
 	 t_address.recv_areaCode=t_dict_areas.area_code




select * from  t_dict_provinces
desc  t_dict_cities
 city_code     varchar(6)  YES      NULL    


select * from t_goods_category where name="电脑整机"

select * from t_goods_category where id=161
	 	

select * from t_goods_category where parent_id=0


select * from t_goods_category where parent_id = 0