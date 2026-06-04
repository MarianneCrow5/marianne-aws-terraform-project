data "aws_ecs_cluster" "bmr_cluster" {
  cluster_name = var.cluster_name
}

data "aws_ecs_task_definition" "bmr_task" {
  task_definition = var.task_definition_arn
}

