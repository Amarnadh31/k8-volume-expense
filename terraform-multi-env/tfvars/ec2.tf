resource "aws_instance" "expense" {
    for_each = var.instances
    ami = data.aws_ami.my_ami.id
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.multi_env_sg.id]


    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = each.key
        }
    )


}