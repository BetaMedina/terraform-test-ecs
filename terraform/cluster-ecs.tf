resource "aws_ecs_cluster" "node_test_cluster" {
  name = "node_test_cluster_api"
}


resource "aws_ecs_task_definition" "node_test_task" {
  family                   = "node_test_task"
  container_definitions    = <<DEFINITION
  [
    {
      "name": "node_test_task",
      "image": "${aws_ecr_repository.api-test-terraform.repository_url}",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 3333,
          "hostPort": 3333
        }
      ],
      "memory": 512,
      "cpu": 256
    }
  ]
  DEFINITION
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = 512
  cpu                      = 256
  execution_role_arn       = aws_iam_role.ecsTaskRole.arn
}

resource "aws_iam_role" "ecsTaskRole" {
  name               = "ecsTaskRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = aws_iam_role.ecsTaskRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


