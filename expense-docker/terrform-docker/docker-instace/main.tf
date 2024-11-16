resource "aws_instance" "docker" {

  instance_type          = "t2.micro"
  ami = data.aws_ami.docker_ami.id
  vpc_security_group_ids = [data.aws_ssm_parameter.docker_sg_id.value]
  subnet_id              = data.aws_subnet.docker.id
  associate_public_ip_address = true

  tags = merge(
    var.common_tags,
    var.docker_tags,
    {
      Name= local.resource_name
    }
  )
}


resource "null_resource" "docker_scripts" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    instance_id = aws_instance.docker.id
  }

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  connection {
    host = aws_instance.docker.public_ip
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
  }

  provisioner "file" {
    source = "docker.sh"
    destination = "/tmp/docker.sh"
  }

  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
      "sudo chmod +x /tmp/docker.sh",
      "sudo sh /tmp/docker.sh"
    ]
  }
}

resource "aws_route_table_association" "docker" {
  subnet_id      = data.aws_subnet.docker.id
  route_table_id = data.aws_route_table.selected.id
}


resource "aws_ebs_volume" "Docker_volume" {
  availability_zone = "us-east-1a"
  size              = 50
  type = "gp3"
  throughput = 125
  iops = 3000

  tags = {
    Name = "docker_vol"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.Docker_volume.id
  instance_id = aws_instance.docker.id
}