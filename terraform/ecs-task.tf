resource "aws_ecs_service" "myservice" {
  name            = "myservice"
  cluster         = aws_ecs_cluster.node_test_cluster.id
  task_definition = aws_ecs_task_definition.node_test_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn
    container_name   = aws_ecs_task_definition.node_test_task.family
    container_port   = 3333
  }

  network_configuration {
    subnets          = ["${aws_default_subnet.subnet_a.id}", "${aws_default_subnet.subnet_b.id}", "${aws_default_subnet.subnet_c.id}"]
    assign_public_ip = true
    security_groups  = ["${aws_security_group.service_security_group.id}"]
  }

}

resource "aws_security_group" "service_security_group" {
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = ["${aws_security_group.lb_security_group.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
