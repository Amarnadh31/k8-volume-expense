locals {
    resource_name = "${var.project_name}-${var.environment_name}"
    public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
    private_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
    database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
    mysql_sg = data.aws_ssm_parameter.mysql_sg_id.value
    backend_sg = data.aws_ssm_parameter.backend_sg_id.value
    frontend_sg = data.aws_ssm_parameter.frontend_sg_id.value
    ansible_sg = data.aws_ssm_parameter.ansible_sg_id.value
}