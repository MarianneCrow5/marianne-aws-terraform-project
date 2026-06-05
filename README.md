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

## S3‑Triggered Lambda: Image Metadata Processor

This Lambda function is the entry point for my portion of the serverless pipeline. It is triggered automatically whenever a new file is uploaded to the designated S3 input bucket. The function retrieves the object metadata, performs basic validation, and writes a structured record into the shared DynamoDB table (`bmr-dynamodb-table`) used by the group.

### Trigger
- **Event Source:** `s3:ObjectCreated:*`
- **Bucket:** Beau’s shared input bucket (ARN provided in Terraform variables)

### Function Responsibilities
- Parse the S3 event notification to extract:
  - Bucket name  
  - Object key  
  - Timestamp  
  - File size  
  - File type (derived from key or metadata)
- Validate that the uploaded object meets expected criteria (image file, non‑zero size)
- Generate a unique record ID for DynamoDB
- Write a structured item to the shared DynamoDB table with:
  - `id` (UUID)  
  - `filename`  
  - `bucket`  
  - `timestamp`  
  - `filesize`  
  - `filetype`  
  - `status` (“received”)  
  - `notes` (“Initial metadata recorded”)

### Outputs
- A DynamoDB record representing the uploaded file and its initial processing state  
- CloudWatch logs for debugging and traceability  

### Why This Matters
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

## Screenshots
All screenshots are included in the documentation files:
- final project screenshots.docx
- more screenshots of final project.docx
- even more screenshots.docx
