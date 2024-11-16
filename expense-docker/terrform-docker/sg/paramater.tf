resource "aws_ssm_parameter" "docker_sg_id" {
  name  = "/${var.project}/${var.environment}/docker_sg_id"
  type  = "String"
  value = module.docker_sg.sg_id
}