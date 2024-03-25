resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.vpc_main.vpc_id
}

resource "aws_ssm_parameter" "public_subnet_ids_id" {
  name  = "/${var.project_name}/${var.environment}/public_subnet_id"
  type  = "StringList"
  value = join(",", module.vpc_main.public_subnet_ids)
}

resource "aws_ssm_parameter" "private_subnet_ids_id" {
  name  = "/${var.project_name}/${var.environment}/private_subnet_id"
  type  = "StringList"
  value = join(",", module.vpc_main.private_subnet_ids)
}

resource "aws_ssm_parameter" "database_subnet_ids_id" {
  name  = "/${var.project_name}/${var.environment}/database_subnet_id"
  type  = "StringList"
  value = join(",", module.vpc_main.database_subnet_ids)
}
