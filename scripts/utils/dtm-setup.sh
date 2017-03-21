#!/bin/bash

# DTM setup helper
# based on API docs at https://dtm-staging.adobe.com/docs/

company=$1
token=$2
name=$3
iteration=$4

# get list of companies (required to get company ID for API calls)
#curl "http://dtm.adobe.com/api/companies" -X GET \
#	-H "Authorization: Token token=\"37eb95d5ddbf639b1420f5a1f9ac516b345d930f\"" \
#	-H "Host: dtm.adobe.com" \
#	-H "Cookie: "

# create web properties
for ((i = 1 ; i <= 1 ; i++ )); do
	echo "creating DTM web property $i"

    prop=$(curl "https://dtm.adobe.com/api/companies/$company/web_properties" -d "{\"web_property\":{\"name\":\"$name-$i-$iteration\",\"url\":\"http://localhost\"}}" -X POST \
        -H "Content-Type: application/json" \
        -H "Authorization: Token token=\"$token\"" \
        -H "Host: dtm.adobe.com" \
        -H "Cookie: " | grep -m 1 -Eo [a-zA-Z0-9]{40} | head -1)

    echo "Created $prop"

    echo "publishing $prop"

    curl "http://example.org/api/web_properties/$prop/publishes" -d '' -X POST \
	    -H "Authorization: Token token=\"$token\"" \
	    -H "Host: dtm.adobe.com" \
	    -H "Content-Type: application/x-www-form-urlencoded" \
	    -H "Cookie: "

    #echo "Creating PageName data element"
    #curl "https://dtm.adobe.com/api/web_properties/$prop/data_elements" -d 'data_element[name]=PageName&data_element[category]=custom&data_element[custom_code]=return window.location.pathname.substring(1, window.location.pathname.lastIndexOf(".")).replace(/\//g , ":");' -X POST -H "Authorization: Token token=\"$token\"" -H "Host: dtm.adobe.com" -H "Content-Type: application/x-www-form-urlencoded" -H "Cookie: "

	#echo "Creating TotalDonation data element"
    #curl "https://dtm.adobe.com/api/web_properties/$prop/data_elements" -d 'data_element[name]=TotalDonation&data_element[category]=custom&data_element[custom_code]=return ContextHub.get("/donation/total");' -X POST -H "Authorization: Token token=\"$token\"" -H "Host: dtm.adobe.com" -H "Content-Type: application/x-www-form-urlencoded" -H "Cookie: "

    #echo "Creating NewDonation data element"
    #curl "https://dtm.adobe.com/api/web_properties/$prop/data_elements" -d 'data_element[name]=NewDonation&data_element[category]=url_param&data_element[url_parameter_name]=donation' -X POST -H "Authorization: Token token=\"$token\"" -H "Host: dtm.adobe.com" -H "Content-Type: application/x-www-form-urlencoded" -H "Cookie: "
done


