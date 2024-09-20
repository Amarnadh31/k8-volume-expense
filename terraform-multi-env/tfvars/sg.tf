resource "aws_security_group" "multi_env_sg" {
    name = var.sg_name
    description = "its multi env sg group"

    tags = merge (
        var.common_tags,
        var.tags
    )
}


resource "aws_vpc_security_group_ingress_rule" "multi_ingress" {
    security_group_id = aws_security_group.multi_env_sg.id
    for_each = var.ingress_1
    from_port         = each.value.from_port
    to_port           = each.value.to_port
    ip_protocol       = each.value.ip_protocol
    cidr_ipv4         = each.value.cidr_ipv4


}

resource "aws_vpc_security_group_egress_rule" "multi_egress" {
    security_group_id = aws_security_group.multi_env_sg.id
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"

}