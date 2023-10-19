#!/bin/bash
 
input_file="variables.json"
 
jq -r '.lambda[] | "\(.LAMBDA_NAME), \(.LAMBDA_CFT_NAME), \(.LAMBDA_DESCRIPTION)"' "$input_file" |
while IFS= read -r lambda_info; do
 
    LAMBDA_NAME=$(echo "$lambda_info" | cut -d ',' -f1)
    LAMBDA_CFT_NAME=$(echo "$lambda_info" | cut -d ',' -f2)
    LAMBDA_DESCRIPTION=$(echo "$lambda_info" | cut -d ',' -f3)
 
    echo "LAMBDA_NAME: $LAMBDA_NAME"
	zip -r $LAMBDA_NAME.zip lambda_function.py
	aws lambda update-function-code --function-name $LAMBDA_NAME --zip-file fileb://$LAMBDA_NAME.zip
    echo "LAMBDA_CFT_NAME: $LAMBDA_CFT_NAME"
    echo "LAMBDA_DESCRIPTION: $LAMBDA_DESCRIPTION"
    echo "--------------------------------"
	aws cloudformation update-stack --stack-name $LAMBDA_CFT_NAME --tags Key=Project,Value=InstaGo Key=Owner,Value=MonishParekh Key=Environment,Value=Production Key=Application,Value=InstaGo Key=Name,Value=$LAMBDA_CFT_NAME --template-body file://$LAMBDA_NAME.yml --parameters file://$input_file --capabilities CAPABILITY_NAMED_IAM
done
