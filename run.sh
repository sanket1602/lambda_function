#!/bin/bash
 
input_file="variables.json"
 
jq -r '.lambda[] | "\(.LAMBDA_NAME), \(.LAMBDA_CFT_NAME), \(.LAMBDA_DESCRIPTION)"' "$input_file" |
while IFS= read -r lambda_info; do
 
    LAMBDA_NAME=$(echo "$lambda_info" | cut -d ',' -f1)
    LAMBDA_CFT_NAME=$(echo "$lambda_info" | cut -d ',' -f2)
    LAMBDA_DESCRIPTION=$(echo "$lambda_info" | cut -d ',' -f3)
 
    echo "LAMBDA_NAME: $LAMBDA_NAME"
    echo "LAMBDA_CFT_NAME: $LAMBDA_CFT_NAMEl"
    echo "LAMBDA_DESCRIPTION: $LAMBDA_DESCRIPTION"
    echo "--------------------------------"
done
