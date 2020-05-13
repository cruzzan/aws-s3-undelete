#!/bin/bash
#please provide the bucketname and path to destination folder to restore
# Remove all versions and delete markers for each object

function do_stop() {
    echo
    echo "Stopping..."
    exit 0
}


trap 'do_stop' SIGTERM
trap 'do_stop' SIGSTOP

echo "Searching for files in the bucket \"$1\" with the prefix \"$2\" to remove the delete marker versions";
read -p "Does that sound right? " -n 1 -r

aws s3api list-object-versions --bucket $1 --prefix $2 --output text | 
grep "DELETEMARKERS" | while read obj
  do
    trap 'do_stop' SIGINT
    KEY=$( echo $obj| awk '{print $3}')
    VERSION_ID=$( echo $obj | awk '{print $5}')
    echo $KEY
    echo $VERSION_ID
    aws s3api delete-object --bucket $1 --key $KEY --version-id $VERSION_ID

  done
