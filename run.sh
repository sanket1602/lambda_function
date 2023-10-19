#!/bin/bash
 
input_file="variables.json"
 
jq -r '.lambda_details[] | "\(.LAMBDA_NAME), \(.LAMBDA_DESCRIPTION), \(.LAMBDA_CFT_NAME)"' "$input_file" |


echo "Lambda Name: $LAMBDA_NAME"
echo "Lambda description: $LAMBDA_DESCRIPTION"
echo "Lambda cft name: $age years ($LAMBDA_CFT_NAME)"