#!/bin/bash

exec < $1
read head
let "counter = 0"
while IFS="," read -r col1 col2
do
  	#check for batch size from $4
	 if [[ "counter" -eq $4 ]]; then
		let "counter = 0"
		echo ""
        echo "Waiting for $5 secs..."
		echo ""

	 	sleep $5
	 fi

	## use curl command here e.g. curl -u admin:admin -d "payloadType=JCR_PATH&model=%2Fvar%2Fworkflow%2Fmodels%2Factivationmodel&payload=%2Fcontent%2Fdam%2Fwe-retail%2Fen%2Ffeatures%2Ftracking.png" http://no1010042032227.corp.adobe.com:4502/etc/workflow/instances
    STATUS_CODE=$(curl -sw '%{http_code}' \
        -o /dev/null \
        -u admin:admin \
        --data-urlencode "payloadType=JCR_PATH" \
        --data-urlencode "model=$3" \
        --data-urlencode "payload=$col1" \
        $2)


    if [[ $STATUS_CODE -eq 201 ]]; then
        echo Successfully started worklfow for [ $col1 ]
    else
        echo Failed to start worklfow for [ $col1 ]
    fi

	((++counter))
done
