data "aws_ami" "docker_ami"{
    most_recent = true
    owners = ["973714476881"]

    filter {
        name = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }
    filter {
        name = "root-device-type"
        values = ["ebs"]
    }
}

data "aws_vpc" "docker" {
  default = true
}

data "aws_route_table" "selected" {
  vpc_id = data.aws_vpc.docker.id
}

data "aws_subnet" "docker" {
    filter {
    name   = "vpc-id"
    values = [data.aws_vpc.docker.id]  # Replace with your VPC ID variable
  }

  filter {
    name   = "availability-zone"
    values = ["us-east-1a"]  # Replace with the correct AZ
  }

}

data "aws_ssm_parameter" "docker_sg_id" {
  name  = "/${var.project}/${var.environment}/docker_sg_id"
}