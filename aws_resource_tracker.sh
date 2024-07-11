#!/bin/bash
#
#
####################################
# Author: Nikita
# Date: 29th-Jun
#
#Verion: v1
#
#This scrip will report the AWS resource usage
####################################
#

set -x

#
#What are we going to track?
#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM Users
#
#list s3 buckets
echo "Print list of s3 buckets"
aws s3 ls > resourceTracker

#list EC2 instance
echo "Print list of ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker

#list lambda
echo "Print list of lambdas" 
aws lambda list-functions >> resourceTracker

#list IAM users
echo "Print list of users"
aws iam list-users >> resourceTracker 


