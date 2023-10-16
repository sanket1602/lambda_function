#!/bin/bash

# Setthe environment variables
LAMBDA_NAME="lambda_3"
#LAMBDA_CFT_NAME="lambda-3-lambdafuntion"
# export LAMBDA_YML_NAME="lambda_3.yml"
# export LAMBDA_ZIP_NAME="lambda_3.zip"


zip -r $LAMBDA_NAME.zip lambda_function.py
aws lambda update-function-code --function-name $LAMBDA_NAME --zip-file fileb://$LAMBDA_NAME.zip