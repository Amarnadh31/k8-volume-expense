module "docker_sg" {
    source = "git::https://github.com/Amarnadh31/terraform-security-group-module.git"
    project_name = var.project
    sg_name = "docker-sg"
    environment_name = var.environment
    vpc_id = data.aws_vpc.docker.id
    common_tags = var.common_tags
    sg_tags = var.docker_tags

}

resource "aws_security_group_rule" "docker_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.docker_sg.sg_id

}

resource "aws_security_group_rule" "docker_port80" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.docker_sg.sg_id

}

resource "aws_security_group_rule" "docker_port3306" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.docker_sg.sg_id

}

resource "aws_security_group_rule" "docker_port8080" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.docker_sg.sg_id

}
