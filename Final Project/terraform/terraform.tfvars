cluster_name = "fargate-m-crow"
task_definition_arn = "arn:aws:ecs:us-west-2:587815504925:task-definition/bmr-pipeline:7"
ddb_table           = "bmr-dynamodb-table"

subnet_ids = [
    "025a53f8270d6b76e",
    "0790c881bff517971"
]

security_group_id = "sg-0123456789abcdef0"

input_bucket  = "bmr-input-bucket"
output_bucket = "bmr-output-bucket"
