#!/bin/bash
 
input_file="variables.json"
 
jq -r '.lambda[] | "\(.LAMBDA_NAME)"' "$input_file" |
while IFS= read -r lambda_info; do
 
    LAMBDA_NAME=$(echo "$lambda_info" | cut -d ',' -f1)
    LAMBDA_CFT_NAME=$(echo "$lambda_info" | cut -d ',' -f2)
	
	echo "======================================"  
	echo "======================================"  	
	echo "LAMBDA_NAME: $LAMBDA_NAME"
	echo "======================================"  
	echo "======================================"   
	echo "Convert lambda_function file to .zip"
	zip -r $LAMBDA_NAME.zip lambda_function.py
    echo "======================================"
    echo "======================================"
	echo "Update new lambda code on mention Lambda"
	aws lambda update-function-code --function-name $LAMBDA_NAME --zip-file fileb://$LAMBDA_NAME.zip
    echo "======================================"
    echo "======================================"
done
