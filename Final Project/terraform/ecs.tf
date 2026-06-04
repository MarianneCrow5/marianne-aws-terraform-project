# Looks up existing ECS resources so Terraform can reference them

# ECS cluster (created by the group)
data "aws_ecs_cluster" "bmr_cluster" {
  cluster_name = var.cluster_name
}

# ECS task definition (created by the group)
data "aws_ecs_task_definition" "bmr_task" {
  task_definition = var.task_definition_arn
}

