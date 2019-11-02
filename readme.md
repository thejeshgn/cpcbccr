#Code
All the code exists in the code folder. There are three python scripts, they all use data.sqlite3 databse inside data/db/data.sqlite3.  Check sites table to see all the sites are setup before you start

1. setup_pull.py # you need to setup the dates for which you need to get data. After that run this script. This sets up all the requests that needs to be called to pull the data.
2. pull.py # call this to actually pull the data setup in the previous script. Data received is JSON
3. parse.py # this actually parses the data got in step 2 and creates the table

#Data
1. The main db is in data/db/data.sqlite3
2. some reports are in reports tab along with the sqls I generally use
3. test - some test data, ignore it
