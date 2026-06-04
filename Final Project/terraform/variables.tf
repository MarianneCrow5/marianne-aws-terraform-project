# Stores input variables for the pipeline

# S3 bucket names
variable "input_bucket" {}
variable "output_bucket" {}

# DynamoDB table name
variable "ddb_table" {}

# ECS configuration
variable "cluster_name" {}
variable "task_definition_arn" {}

# Networking
variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {}
