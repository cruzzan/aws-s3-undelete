# Undelete files in AWS S3

### Requirements
* AWS CLI >= 1.16.130
* An S3 bucket with version control

### Usage
Restore all files that have been flagged as deleted in a bucket:

```bash
./undelete-files.sh [some_bucket]
```

Restore all files that have been flagged as deleted in a specific directory in a bucket:
```bash
./undelete-files.sh·[some_bucket] some/dir/in/the/bucket
```
