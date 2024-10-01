# Terraform AWS Infrastructure Setup

This Terraform configuration sets up an AWS infrastructure with the following resources:
- An S3 bucket for storing images
- A CloudFront distribution for serving the content from the S3 bucket

## Features

- Creates an S3 bucket configured for image storage
- Sets up bucket policies to restrict access to CloudFront only
- Configures a CloudFront distribution that points to the S3 bucket
- Uses reusable Terraform modules for better organization
- Outputs useful information such as the CloudFront distribution URL

## Requirements

- Terraform >=1.9.0
- AWS >=5.0
- AWS account with appropriate permissions

## Installation

1. Clone this repository or download the Terraform configuration files.

2. Configure your AWS credentials. You can do this by setting the following environment variables:

## Usage

1. Navigate to the directory containing the Terraform files.

   ```bash
   cd terraform
   ```

2. Initialize Terraform to download the required providers:

   ```bash
   terraform init
   ```

3. Create a plan to see what resources will be created:

   ```bash
   terraform plan -var="bucket_prefix=bull-media"
   ```

4. Apply the Terraform configuration to provision the resources:

   ```bash
   terraform apply -var="bucket_prefix=bull-media"
   ```

5. Review the outputs for important information, such as the CloudFront distribution URL.

## Outputs

After applying the configuration, the following outputs will be displayed:

- **CloudFront Distribution URL**: The URL to access your content via CloudFront.
- **S3 Bucket Name**: The name of the created S3 bucket.

## Clean Up

To destroy all resources created by this configuration, run:

```bash
terraform destroy
```