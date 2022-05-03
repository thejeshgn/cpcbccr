import re
from datetime import datetime
from datetime import timedelta
import base64
import requests
import dataset
import json
import hashlib 
import time

db = dataset.connect('sqlite:///../data/db/data.sqlite3')
site_table = db["sites"]
table = db["request_status_data"]
status_code = 1 
row_exists = table.find_one(status_code=status_code)

while row_exists: 	
	print("#####################################################"+ str(datetime.fromtimestamp(time.time()).strftime('%Y-%m-%d %H:%M:%S')))
	db.begin()
	query_name =row_exists['query_name'] 
	print("query_name = "+str(query_name))
	encoded_data = row_exists['encoded_data'] 

	headers = {'Origin': 'https://app.cpcbccr.com'}
	headers['Accept-Encoding'] ="gzip, deflate, br"
	headers['Accept-Language'] ="en-GB,en-US;q=0.9,en;q=0.8"
	headers['User-Agent'] ="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36"
	headers['Content-Type'] ="application/x-www-form-urlencoded"
	headers['Accept'] ="application/json, text/plain, */*"
	headers['Referer'] ="https://app.cpcbccr.com/ccr/"
	headers['Connection'] ="keep-alive"
	headers['Host'] ="app.cpcbccr.com"

	r = requests.post("https://app.cpcbccr.com/caaqms/fetch_table_data", headers=headers, data=encoded_data, verify=False)
	if r.status_code == 200:
		print("Awesome response code 200")
		json_data = json.dumps(r.json())
		json_data_hash = hashlib.md5(json_data.encode("UTF8"))
		row_exists['json_data'] = json_data
		row_exists['json_data_hash'] = json_data_hash.hexdigest()
		row_exists['status_code'] = r.status_code
	else:
		row_exists['json_data'] = ""
		row_exists['status_code'] = r.status_code

	print("UPDATING")
	table.update(row_exists,['id'])
	db.commit()

	time.sleep(5)
	row_exists = table.find_one(status_code=status_code)
	if row_exists:
		pass
	else:
		break

	#this is for testing	
	#break

print("_______________________________________________________________")

#end while
