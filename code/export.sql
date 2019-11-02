select id,city,site_name,site,state,query_name,from_date date, from_time as time, pm25,pm10, 



 ( substr(from_date,8,4)|| CASE substr(from_date,4,3)
         WHEN 'Jan' THEN '01'
         WHEN 'Feb' THEN '02'
         WHEN 'Mar' THEN '03'
         WHEN 'Apr' THEN '04'
         WHEN 'May' THEN '05'
         WHEN 'Jun' THEN '06'
         WHEN 'Jul' THEN '07'
         WHEN 'Aug' THEN '08'
         WHEN 'Sep' THEN '09'
         WHEN 'Oct' THEN '10'
         WHEN 'Nov' THEN '11'
         WHEN 'Dec' THEN '12' 
   END
 ||substr(from_date,1,2)  ) as "YYYYMMDD"

from data         
        


    