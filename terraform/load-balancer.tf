resource "aws_alb" "api_test_load_balancer" {
  name               = "test-node-lb"
  load_balancer_type = "application"
  subnets            = ["${aws_default_subnet.subnet_a.id}", "${aws_default_subnet.subnet_b.id}", "${aws_default_subnet.subnet_c.id}"]
  # security_groups = 
}

resource "aws_security_group" "lb_security_group" {
  ingress {
    description = "Access http port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    to_port     = 0
  }
}

