# security group

resource "aws_security_group" "this" {
  name        = var.name
  description = "security group for ${var.name}"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  // ALL
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  // SSH
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    security_groups = [data.terraform_remote_state.bastion.outputs.bastion_sg_id]
  }

  // HTTP
  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = var.allow_ip_address_web
  }
  
  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  tags = {
    Name = var.name
  }
}


resource "aws_security_group" "alb" {
  name        = "${var.name}-alb"
  description = "security group for ${var.name}"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }

  // ALL
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  // HTTP
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = var.allow_ip_address_lb
  }
  
  #ingress {
  #  from_port   = "80"
  #  to_port     = "80"
  #  protocol    = "tcp"
  #  security_groups = [data.terraform_remote_state.nginx.outputs.nginx_sg_id]
  #}
  
  tags = {
    Name = var.name
  }
}
