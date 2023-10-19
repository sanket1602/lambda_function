#!/bin/bash
 
input_file="variables.json"
 
jq -r '.lambda_details[] | "\(.LAMBDA_NAME), \(.LAMBDA_DESCRIPTION), \(.LAMBDA_CFT_NAME)"' "$input_file" |
while IFS= read -r lambda_info; do
    Lambda Name=$(echo "$lambda_info" | cut -d ',' -f1)
    Lambda description=$(echo "$lambda_info" | cut -d ',' -f2)
    Lambda cft name=$(echo "$lambda_info" | cut -d ',' -f3)


    echo "Lambda Name: $LAMBDA_NAME"
    echo "Lambda description: $LAMBDA_DESCRIPTION"
    echo "Lambda cft name: $LAMBDA_CFT_NAME"
done