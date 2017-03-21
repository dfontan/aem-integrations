#!/bin/bash

usr="lab-api-usr:AEM%20Lab%202016"
pwd="a3e3a80beba35453aacdad953312ccdf"

getEnabledSolutions() {
    wsse=$(curl "http://localhost/wsse.php?usr=$usr&pwd=$pwd")
    curl -w "@curl-format.txt" -o "resp/$1.json" -s -H "$wsse" 'https://api5.omniture.com/rs/0.5/dms/?depth=1&expansion=enabledsolutions&company=AEM+Lab+2016' > "resp/$1-time.json"
}

for ((i = 1 ; i <= 1 ; i++ )); do
    getEnabledSolutions "$i" &
done
