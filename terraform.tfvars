
# ===%%% EC2 Instance %%%=== #
vpc = ["akatruk-ec2-vm1"]
access_key = "AKIATO7LNMFVMAQWRLM2"
ami_redhut = "ami-0ba7c4110ca9bfe0b"
secret_key = "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"
region     = "eu-west-3"
instance_type = "t3.micro"
user =  "user_deploy"
owner = "Andrey Katruk"
goal = "Testing wal-g"

# ===%%% S3 Bucket %%%=== #
bucket_name = "akatruk-s3"
/* storage_class = "ONEZONE_IA" */
# Can be ONEZONE_IA, STANDARD_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE