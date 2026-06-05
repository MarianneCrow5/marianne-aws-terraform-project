This project demonstrates a complete AWS infrastructure deployment using Terraform, including IAM, Lambda, S3, and ECS components.
# Final Project – AWS Terraform Pipeline

This repository contains my IT 261 final project, which demonstrates a working AWS pipeline built with Terraform. The project includes:

- Terraform configuration files (IAM, Lambda, S3, ECS, variables, etc.)
- Lambda function code
- Project documentation
- Screenshots of the working pipeline
- Statement of Work and project checklist

## What the project does
This project provisions AWS resources using Terraform, deploys a Lambda function, and demonstrates automated infrastructure deployment.

## Presigned URL Generator (Lightweight Lambda)

To support uploading any user‑selected image to the S3 input bucket, the project includes a small Lambda function that generates **pre‑signed S3 URLs** on demand. This Lambda runs only when a user uploads a file and executes for just a few milliseconds. Because of this, it has **negligible cost** and does **not** materially affect the project budget that was previously submitted.

This Lambda enables the upload page to:

- request a fresh pre‑signed URL for each file  
- support any filename and content type  
- securely upload images to the S3 input bucket  

This component is a standard part of S3 upload architecture and ensures the frontend upload tool works reliably.
import json
import boto3
import uuid
from datetime import datetime

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table("bmr-dynamodb-table")   # your shared table name

def lambda_handler(event, context):
    # Extract S3 event info
    record = event["Records"][0]
    bucket = record["s3"]["bucket"]["name"]
    key = record["s3"]["object"]["key"]
    size = record["s3"]["object"].get("size", 0)

    # Basic validation
    if size == 0:
        print(f"Skipping empty file: {key}")
        return {"status": "skipped", "reason": "empty file"}

    # Derive file type from extension
    filetype = key.split(".")[-1].lower()

    # Build DynamoDB item
    item = {
        "id": str(uuid.uuid4()),
        "filename": key,
        "bucket": bucket,
        "timestamp": datetime.utcnow().isoformat(),
        "filesize": size,
        "filetype": filetype,
        "status": "received",
        "notes": "Initial metadata recorded"
    }

    # Write to DynamoDB
    table.put_item(Item=item)

    print(f"Metadata stored for {key}")
    return {"status": "ok", "item": item}

Outputs
A DynamoDB record representing the uploaded file and its initial processing state

CloudWatch logs for debugging and traceability

Why This Matters
This Lambda function establishes the first step in the pipeline and ensures that every uploaded file is tracked consistently. It also decouples the upload interface from downstream processing, allowing the ECS/Fargate stage to operate independently.
## Terraform File Overview
**main.tf** – Defines the Terraform provider and AWS region  
**variables.tf** – Stores input variables used across the configuration  
**S3.tf** – Defines the S3 buckets used for input and output  
**iam.tf** – Creates IAM roles and policies for Lambda and ECS  
**lambda.tf** – Deploys the Lambda function and its permissions  
**ecs.tf** – Defines the ECS task used to process files

## How to run it
1. Install Terraform
2. Configure AWS credentials
3. Run `terraform init`
4. Run `terraform apply`

## Files included
- `/terraform` – all Terraform configuration files
- `/screenshots` – proof of working pipeline
- Documentation files in the root folder
- 
## Screenshots
All screenshots are included in the documentation files:
- final project screenshots.docx
- more screenshots of final project.docx
- even more screenshots.docx

