select * from request_status_data where status_code = 404;

select * from request_status_data where status_code = 404 or status_code 0;

update request_status_data set status_code = 1 where status_code == 404;

select status_code, count(status_code) from request_status_data group by status_code;

select parsed, count(*) from request_status_data group by parsed


update request_status_data set parsed  = 0;	


select city, count(city) from sites group by city;


select 
fromDate, (substr(fromDate,7,4)||substr(fromDate,4,2)||substr(fromDate,1,2)) as from_date, 
toDate, (substr(toDate,7,4)||substr(toDate,4,2)||substr(toDate,1,2)) as to_date 
from request_status_data
where from_date <= "20171231" and to_date  >= "20171001" and city = "Delhi" and site= 'site_124'
order by from_date, to_date


select *, 
fromDate, (substr(fromDate,7,4)||substr(fromDate,4,2)||substr(fromDate,1,2)) as from_date, 
toDate, (substr(toDate,7,4)||substr(toDate,4,2)||substr(toDate,1,2)) as to_date 
from request_status_data
where from_date <= "20161231" and to_date  >= "20161001" and city = "Delhi" and site ='site_301'
order by from_date, to_date




select * from request_status_data
where status_code = 0



select id,city,site_name,site,state,query_name,from_date,from_time,pm25,pm10
from data where city = "Delhi" and  ( from_date like "%-Oct-2016" or from_date like "%-Nov-2016" or from_date like "%-Dec-2016" )



select id,city,site_name,site,state,query_name,from_date,from_time,pm25,pm10
from data where city = "Delhi" and  ( from_date like "%-Oct-2016" or from_date like "%-Nov-2016" or from_date like "%-Dec-2016" ) and site = 'site_106'



select substr(from_date,4,2) as dt, site, count(*) 
from data where city = "Delhi" and  ( from_date like "%-Oct-2016" or from_date like "%-Nov-2016" or from_date like "%-Dec-2016" ) group by site, dt



select substr(from_date,4,3) as dt, site, count(*) 
from data where city = "Delhi" and  ( from_date like "%-Oct-2016" or from_date like "%-Nov-2016" or from_date like "%-Dec-2016" ) and site='site_103' group by site, dt order by site






select count(*) from data
31763

select count(*) from data where (pm25 == "" or pm25 is null ) and (pm10 == "" or pm10 is null )
9682



select * from data where (pm25 = "" or pm25 is null) and  (pm10 = "" or pm10 is null)




select *  
from data where ( from_date like "%-Oct-2017")



select id,city,site_name,site,state,query_name,from_date,from_time,pm25,pm10 
from data where ( from_date like "%-Oct-2016" or from_date like "%-Nov-2016" or from_date like "%-Dec-2016" ) 



select status_code, count(*) from request_status_data where city ="Delhi" and status_code=0 and 

( fromDate like "%10-2017%" or fromDate like "%11-2017%" or fromDate like "%10-2016%" or fromDate like "%11-2016%" ) 

group by status_code


update request_status_data set status_code=1 where city ="Delhi" and status_code=0 and 

( fromDate like "%10-2017%" or fromDate like "%11-2017%" or fromDate like "%10-2016%" or fromDate like "%11-2016%" ) 

group by status_code






select id,city,site_name,site,state,query_name,from_date,from_time,pm25,pm10 
from data where 
city = "Delhi"
and 

( from_date like "%-Oct-2016" or from_date like "%-Nov-2016" or
	from_date like "%-Oct-2017" or from_date like "%-Nov-2017" or
	from_date like "%-Oct-2018") 



select from_date substr(from_date,4,8)
from data where 
city = "Delhi"
and 

( from_date like "%-Oct-2016" or from_date like "%-Nov-2016" or
	from_date like "%-Oct-2017" or from_date like "%-Nov-2017" or
	from_date like "%-Oct-2018") 


select substr(from_date,4,8) as from_month, site_name, count(*) as total_records
from data where 
city = "Delhi"
and 

( from_date like "%-Oct-2016" or from_date like "%-Nov-2016" or
	from_date like "%-Oct-2017" or from_date like "%-Nov-2017" or
	from_date like "%-Oct-2018") 
	
group by from_month, site_name
order by total_records




update request_status_data 
set status_code = 3 
where 
status_code = 404 and 
(

	(
		fromDate like "%-11-2017%" and site in ("site_106","site_107","site_109","site_113",
		"site_114","site_115","site_117","site_119", "site_122", "site_124", "site_125")
	)
		or
	(
		fromDate like "%-10-2017%"	 and site in ("site_105","site_106","site_107","site_109",
		"site_113","site_114","site_115","site_117","site_119","site_122","site_124","site_125")
	)

)







select from_date substr(from_date,4,8)
from data where 
city = "Delhi"
and 

( from_date like "%-Oct-2016" or from_date like "%-Nov-2016" or
	from_date like "%-Oct-2017" or from_date like "%-Nov-2017" or
	from_date like "%-Oct-2018") 





select id,city,site_name,site,state,query_name,from_date,from_time,pm25,pm10 
from data where 
city = "Delhi"
and 

( from_date like "%-Oct-2016" or from_date like "%-Nov-2016" or
	from_date like "%-Oct-2017" or from_date like "%-Nov-2017" or
	from_date like "%-Oct-2018") 
