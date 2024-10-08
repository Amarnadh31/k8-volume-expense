resource "aws_security_group" "main" {
  name        = local.sg_name
  description = "Allow inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = merge(
    var.common_tags,
    var.sg_tags,
    {
        Name = local.sg_name
    }
  )
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


