resource "aws_ecs_cluster" "backend-fast-food-cluster" {
  name = "Cluster-${var.clusterName}"
}

resource "aws_ecs_task_definition" "backend-fast-food-task" {
  family                   = "Task-${var.projectName}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  
  container_definitions = jsonencode([{
    name  = "${var.projectName}"
    image = "jackienascimento/backend-fast-food:latest"
    portMappings = [{
      containerPort = 3000
      hostPort      = 3000
    }]
  }])
}

resource "aws_ecs_service" "backend-fast-food-service" {
  name            = "SVC-${var.projectName}"
  cluster         = aws_ecs_cluster.backend-fast-food-cluster.id
  task_definition = aws_ecs_task_definition.backend-fast-food-task.arn
  launch_type     = "FARGATE"
  desired_count   = 3

  network_configuration {
    subnets = ["${var.subnet}"]
    security_groups = ["${aws_security_group.backend-fast-food-sg.id}"]
  }
}
