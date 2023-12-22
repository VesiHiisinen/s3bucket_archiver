# s3bucket_archiver
A simple bash script which uses aws cli 2.x and tar to download, sync and archive all the S3 buckets of an AWS account
## Requirements
Linux, AWS CLI 2.x, zip, GNU tar
## Usage
The script takes AWS Profile as a parameter and then syncs (downloads) all the content to the current folder. For each bucket, a corresponding target folder is created. After that, all the folders are archived with gzip/tar and placed in the current folder.
