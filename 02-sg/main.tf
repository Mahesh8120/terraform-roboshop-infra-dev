module "vpn_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_vpc.default.id
  sg_name = "vpn"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for vpn"
}

module "mongodb_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "mongodb"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for mongodb"
}

module "redis_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "redis"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for redis"
}


module "mysql_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "mysql"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for mysql"
}

module "rabbitmq_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "rabbitmq"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for rabbitmq"
}

module "cart_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "cart"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for cart"
}



module "catalogue_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "catalogue"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for catalogue"
}


module "user_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "user"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for user"
}

module "payment_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "payment"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for payment"
}

module "shipping_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "shipping"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for shipping"
}

module "web_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "web"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for web"
}

module "app_alb_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "app_alb"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for alb"
}
module "web_alb_sg" {
  source = "../../terraform-aws-security-group"
  project_name = var.project_name
  environment = var.environment
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  sg_name = "web_alb"
  common_tags = var.common_tags
  sg_tags = var.sg_tags
  description = "sg for webalb"
}



# mongodb accepting connections from vpn
resource "aws_security_group_rule" "mongodb_vpn" {
  source_security_group_id = module.vpn_sg.sg_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.mongodb_sg.sg_id
}


resource "aws_security_group_rule" "mongodb_catalogue" {
  source_security_group_id = module.catalogue_sg.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb_sg.sg_id
}

resource "aws_security_group_rule" "mongodb_user" {
  source_security_group_id = module.user_sg.sg_id
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = module.mongodb_sg.sg_id
}
# redis is accepting connections from vpn 
resource "aws_security_group_rule" "redis_vpn" {
  source_security_group_id = module.vpn_sg.sg_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.redis_sg.sg_id
}

resource "aws_security_group_rule" "redis_user" {
  source_security_group_id = module.user_sg.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis_sg.sg_id
}

resource "aws_security_group_rule" "redis_cart" {
  source_security_group_id = module.cart_sg.sg_id
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  security_group_id = module.redis_sg.sg_id
}

# mysql accepting connections from vpn
resource "aws_security_group_rule" "mysql_vpn" {
  source_security_group_id = module.vpn_sg.sg_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.mysql_sg.sg_id
}

resource "aws_security_group_rule" "mysql_shipping" {
  source_security_group_id = module.shipping_sg.sg_id
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  security_group_id = module.mysql_sg.sg_id
}
# rabbitmq accepting connections from vpn
resource "aws_security_group_rule" "rabbitmq_vpn" {
  source_security_group_id = module.vpn_sg.sg_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.rabbitmq_sg.sg_id
}

resource "aws_security_group_rule" "rabbitmq_payment" {
  source_security_group_id = module.payment_sg.sg_id
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  security_group_id = module.rabbitmq_sg.sg_id
}

# catalogue accepting connections from vpn
resource "aws_security_group_rule" "catalogue_vpn" {
  source_security_group_id = module.vpn_sg.sg_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.catalogue_sg.sg_id
}

resource "aws_security_group_rule" "app_alb_catalogue" {
  source_security_group_id = module.catalogue_sg.sg_id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.app_alb_sg.sg_id
}

resource "aws_security_group_rule" "catalogue_app_alb" {
  source_security_group_id = module.app_alb_sg.sg_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.catalogue_sg.sg_id
}


# resource "aws_security_group_rule" "catalogue_web" {
#   source_security_group_id = module.web_sg.sg_id
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.catalogue_sg.sg_id
# }

# cart accepting connections from vpn
resource "aws_security_group_rule" "cart_vpn" {
  source_security_group_id = module.vpn_sg.sg_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.cart_sg.sg_id
}
resource "aws_security_group_rule" "cart_app_alb" {
  source_security_group_id = module.app_alb_sg.sg_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.cart_sg.sg_id
}

resource "aws_security_group_rule" "app_alb_cart" {
  source_security_group_id = module.cart_sg.sg_id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.app_alb_sg.sg_id
}
resource "aws_security_group_rule" "cart_shipping" {
  source_security_group_id = module.shipping_sg.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart_sg.sg_id
}

resource "aws_security_group_rule" "cart_payment" {
  source_security_group_id = module.payment_sg.sg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.cart_sg.sg_id
}
# resource "aws_security_group_rule" "cart_web" {
#   source_security_group_id = module.web_sg.sg_id
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.web_sg.sg_id
# }

# user accepting connections from vpn
resource "aws_security_group_rule" "user_vpn" {
  source_security_group_id = module.vpn_sg.sg_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.user_sg.sg_id
}

resource "aws_security_group_rule" "user_app_alb" {
  source_security_group_id = module.app_alb_sg.sg_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.user_sg.sg_id
}

resource "aws_security_group_rule" "app_alb_user" {
  source_security_group_id = module.user_sg.sg_id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.app_alb_sg.sg_id
}
# resource "aws_security_group_rule" "user_web" {
#   source_security_group_id = module.web_sg.sg_id
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.user_sg.sg_id
# }


# resource "aws_security_group_rule" "user_payment" {
#   source_security_group_id = module.payment_sg.sg_id
#   type                     = "ingress"
#   from_port                = 8080
#   to_port                  = 8080
#   protocol                 = "tcp"
#   security_group_id        = module.user_sg.sg_id
# }

# payment accepting connections from vpn
resource "aws_security_group_rule" "payment_vpn" {
  source_security_group_id = module.vpn_sg.sg_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.payment_sg.sg_id
}

resource "aws_security_group_rule" "payment_app_alb" {
  source_security_group_id = module.app_alb_sg.sg_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.payment_sg.sg_id
}
resource "aws_security_group_rule" "app_alb_payment" {
  source_security_group_id = module.payment_sg.sg_id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.app_alb_sg.sg_id
}
# resource "aws_security_group_rule" "payment_web" {
#   source_security_group_id = module.web_sg.sg_id
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.payment_sg.sg_id
# }

# shipping accepting connections from vpn
resource "aws_security_group_rule" "shipping_vpn" {
  source_security_group_id = module.vpn_sg.sg_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = module.shipping_sg.sg_id
}
resource "aws_security_group_rule" "shipping_app_alb" {
  source_security_group_id = module.app_alb_sg.sg_id
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  security_group_id = module.shipping_sg.sg_id
}
resource "aws_security_group_rule" "app_alb_shipping" {
  source_security_group_id = module.shipping_sg.sg_id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.app_alb_sg.sg_id
}
# resource "aws_security_group_rule" "shipping_web" {
#   source_security_group_id = module.web_sg.sg_id
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   security_group_id = module.shipping_sg.sg_id
# }

# App ALB should accept connections only from VPN, since it is internal
resource "aws_security_group_rule" "app_alb_vpn" {
  source_security_group_id = module.vpn_sg.sg_id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.app_alb_sg.sg_id
}

resource "aws_security_group_rule" "app_alb_web" {
  source_security_group_id = module.web_sg.sg_id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.app_alb_sg.sg_id
}

resource "aws_security_group_rule" "web_internet" {
  cidr_blocks = ["0.0.0.0/0"]
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.web_sg.sg_id
}
resource "aws_security_group_rule" "web_vpn" {
  source_security_group_id = module.vpn_sg.sg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.web_sg.sg_id
}

resource "aws_security_group_rule" "web_alb_internet" {
  cidr_blocks = ["0.0.0.0/0"]
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = module.web_alb_sg.sg_id
}

#openvpn
resource "aws_security_group_rule" "vpn_home" {
  security_group_id = module.vpn_sg.sg_id
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}