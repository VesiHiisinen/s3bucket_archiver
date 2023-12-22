#!/bin/bash

# Check if the AWS profile parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <AWS_PROFILE>"
  exit 1
fi

# Set the AWS CLI profile
AWS_PROFILE="$1"

# Get a list of S3 buckets
buckets=($(aws s3 ls --profile $AWS_PROFILE | awk '{print $3}'))

# Loop through each bucket
for bucket in "${buckets[@]}"
do
  # Create a directory with the bucket name
  mkdir "$bucket"

  # Sync the bucket content to the created directory
  aws s3 sync "s3://$bucket" "$bucket" --profile $AWS_PROFILE
done

# Create tar.gz archives for each directory
for bucket in "${buckets[@]}"
do
  tar -czvf "$bucket.archive.tar.gz" "$bucket"
done
