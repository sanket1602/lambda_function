#!/bin/bash

# Setthe environment variables
# LAMBDA_NAME="lambda_3"
LAMBDA_CFT_NAME="lambda-3-lambdafuntion"
# LAMBDA_DESCRIPTION="deployment completed"
# export LAMBDA_YML_NAME="lambda_3.yml"
# export LAMBDA_ZIP_NAME="lambda_3.zip"

LAMBDA_VALUE= `jq -r ".Parameter_Key" "$variables.json"`
LAMBDA_NAME= `jq -r ".Parameter_Value" "$variables.json"`


zip -r $LAMBDA_NAME.zip lambda_function.py
aws lambda update-function-code --function-name $LAMBDA_NAME --zip-file fileb://$LAMBDA_NAME.zip
aws cloudformation update-stack --stack-name $LAMBDA_CFT_NAME --tags Key=Project,Value=InstaGo Key=Owner,Value=MonishParekh Key=Environment,Value=Production Key=Application,Value=InstaGo Key=Name,Value=$LAMBDA_CFT_NAME --template-body file://$LAMBDA_NAME.yml --parameters file://variables.json --capabilities CAPABILITY_NAMED_IAM


