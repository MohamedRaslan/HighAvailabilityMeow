#!/bin/sh

if [ "$1" == "create" ]
then
   echo "A new stack will be created"
   aws cloudformation create-stack --stack-name $2 --template-body file://CloudFormation/$3.yaml  --parameters file://CloudFormation/$3.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=$4
   read -p "Press enter to exit"
elif [ "$1" == "delete" ]
then
   echo "The stack will be deleted"
   aws cloudformation delete-stack --stack-name $2
   read -p "Press enter to exit"
elif [ "$1" == "update" ]
then
   echo "The stack will be updated"
   aws cloudformation update-stack --stack-name $2 --template-body file://CloudFormation/$3.yaml  --parameters file://CloudFormation/$3.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=$4
   read -p "Press enter to exit"
else
   echo "No opration selected"
   read -p "Press enter to exit"
fi