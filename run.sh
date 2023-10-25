#!/bin/bash
 
input_file="variables.json"

jq -r '.lambda[] | "\(.LAMBDA_NAME)"' "$input_file" |
while IFS= read -r lambda_info; do

 
    LAMBDA_NAME=$(echo "$lambda_info" | cut -d ',' -f1)


	echo "======================================"  	
	echo "LAMBDA_NAME: $LAMBDA_NAME"
	echo "======================================"   
    echo "change lambda.py file name to lambda_function.py"
	echo "======================================"  
    mv $LAMBDA_NAME.py lambda_function.py
	echo "======================================" 	
	echo "Convert lambda_function file to .zip"
	echo "======================================" 	
	zip -r $LAMBDA_NAME.zip lambda_function.py
	echo "Update new lambda code on mention Lambda"
	echo "======================================"
	aws lambda update-function-code --function-name $LAMBDA_NAME --zip-file fileb://$LAMBDA_NAME.zip
    echo "======================================"
done
