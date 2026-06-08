variable "input_bucket" {}
variable "output_bucket" {}
variable "ddb_table" {}

variable "cluster_name" {}
variable "task_definition_arn" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_id" {}
