import re
from datetime import datetime
from datetime import timedelta
import base64
import requests
import dataset
import json
import hashlib
import time
import traceback

db = dataset.connect("sqlite:///../data/db/data.sqlite3")
request_status_datatable = db["request_status_data"]
data_table = db["data"]


parse_row = request_status_datatable.find_one(parsed=0, status_code=200)


while parse_row:
    print("inside while loop")
    db.begin()
    try:
        print(parse_row)
        json_data = json.loads(parse_row["json_data"])
        data = json_data["data"]
        tabularData = data["tabularData"]
        bodyContent = tabularData["bodyContent"]

        for row in bodyContent:
            insert_row = {}
            insert_row["state"] = parse_row["state"]
            insert_row["city"] = parse_row["city"]
            insert_row["site"] = parse_row["site"]
            insert_row["site_name"] = parse_row["site_name"]
            insert_row["query_name"] = parse_row["query_name"]

            # dateformat : 14-Oct-2017 - 08:00"
            # print str(row)
            if "to date" in row:
                to_date = row["to date"]
                to_date_array = to_date.split(" - ")
                insert_row["to_date"] = to_date_array[0]
                insert_row["to_time"] = to_date_array[1]

            if "from date" in row:
                from_date = row["from date"]
                from_date_array = from_date.split(" - ")
                insert_row["from_date"] = from_date_array[0]
                insert_row["from_time"] = from_date_array[1]

            if "PM2.5" in row:
                pm25 = row["PM2.5"]
                if pm25 and pm25 != "":
                    insert_row["pm25"] = pm25

            if "PM10" in row:
                pm10 = row["PM10"]
                if pm10 and pm10 != "":
                    insert_row["pm10"] = pm10

            print(insert_row)
            data_table.insert(insert_row)
            # parsed
            parse_row["parsed"] = 1

    except Exception:
        traceback.print_exc()
        # error in parsing
        parse_row["parsed"] = 2

    # update row to parsed
    request_status_datatable.update(parse_row, ["id"])
    db.commit()

    parse_row = request_status_datatable.find_one(parsed=0, status_code=200)
    if parse_row:
        pass
    else:
        break
