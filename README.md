# How to use terraform locally #

Authenticate to AWS using the CLI. Provide access key, secret key, us-east-1 for the region (or any other region you want to deploy to), and output format if wanted.

```
aws configure
```

At the top level of this repo run these commands to test the terraform. Setting up the GitOps pipeline is optional.

```
terraform init
terraform plan --var-file="vars/dev.tfvars"
# If you want to test applies locallly, setting up the GitOps is optional
terraform apply --var-file="vars/dev.tfvars"
```

# Setup remote backend (optional) (required for GitOps) #
If you are working on an actualy implementation you should be using remote backends. For a POC implementation you can omit this step.

Login to the AWS account you want tfstate to be stored for a specific environment. This could be a central account or you could create a bucket per environment in the environment specific account. 

- Create an S3 bucket with a unique name in the AWS console
- Create a KMS key and create an alias with that key
- Create a DynamoDB table for the state file. The table must have a partition key named LockID with type of string.

Both the KMS key and DynamoDB table are not required, but are best practice!

Go to the pipeline file and input the proper values per environment for each of the fields. (pipeline file to be created)

If you want additional infromation on backends in general follow this link: https://www.terraform.io/language/settings/backends/configuration
If you want additional information on S3 backends specifically follow this link: https://www.terraform.io/language/settings/backends/s3

# Pre commit #

## Install Dependencies ##

Make sure to install these tools below to use our pre-commit file. You don't have to install them via brew.

```
brew install pre-commit
```

## Before you commit the code you should run: 

```
pre-commit install # Install the pre commit file locally so it triggers on PRs
```

* This will ensure git hooks run automatically on every commit! https://pre-commit.com/#3-install-the-git-hook-scripts


# GitOps Pipeline #