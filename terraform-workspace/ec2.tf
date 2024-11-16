resource "aws_instance" "workspace_instance" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = lookup(var.instance_type, terraform.workspace)
    vpc_security_group_ids = ["sg-07305fd02643afd49"]
    tags = {
        Name = "terraform-${terraform.workspace}"
    }
}