resource "aws_security_group" "backend-fast-food-sg" {
  name        = "SG-${var.projectName}"
  description = "Security Group for Backend Fast Food"
  
  ingress {
    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
