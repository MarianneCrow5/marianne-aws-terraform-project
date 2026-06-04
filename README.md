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

