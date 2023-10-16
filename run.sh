#!/bin/bash

# Setthe environment variables
LAMBDA_NAME="lambda_3"
LAMBDA_CFT_NAME="lambda-3-lambdafuntion"
LAMBDA_DESCRIPTION="Test lambda deployment"
# export LAMBDA_YML_NAME="lambda_3.yml"
# export LAMBDA_ZIP_NAME="lambda_3.zip"


zip -r $LAMBDA_NAME.zip lambda_function.py
aws lambda update-function-code --function-name $LAMBDA_NAME --zip-file fileb://$LAMBDA_NAME.zip
aws cloudformation update-stack --stack-name $LAMBDA_CFT_NAME --tags Key=Project,Value=InstaGo Key=Owner,Value=MonishParekh Key=Environment,Value=Production Key=Application,Value=InstaGo Key=Name,Value=$LAMBDA_CFT_NAME --template-body file://$LAMBDA_NAME.yml --capabilities CAPABILITY_NAMED_IAM