#!/bin/bash

#usr="dii-api:Day%20Integration%20Internal"
#pwd="a326a4e2e98c58c7277aaad0a6701890"

usr=$1
pwd=$2

echo "Requesting WSSE header"
wsse=$(curl "http://localhost/wsse.php?usr=$usr&pwd=$pwd") # requires wsse.php running on a local Apache
#echo $wsse

# list report suites
#curl https://api3.omniture.com/admin/1.4/rest/?method=Company.GetReportSuites --header "$wsse" -d "{ 'types':['standard'] }"

for ((i = 1 ; i <= 2 ; i++ )); do 
	# create report suite
	echo "creating RS $i"
	#curl https://api3.omniture.com/admin/1.4/rest/?method=ReportSuite.Create --header "$wsse" -d "{ 'duplicate_rsid':'admin.template.09', 'go_live_date':'2016-01-07', 'hits_per_day':'500', 'rsid':'Seat$i', 'simplified_menu':'true', 'site_title':'Seat $i', 'time_zone':'US/Arizona' }"
done
