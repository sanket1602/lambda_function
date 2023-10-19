#!/bin/bash
 
input_file="example.json"
 
jq -r '.employees[] | "\(.name), \(.email)"' "$input_file" |
while IFS= read -r employee_info; do
    echo "Employee Info: $employee_info"
done