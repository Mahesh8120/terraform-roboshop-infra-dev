variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    name = "roboshop"
    environment = "dev"
    terraform = "true"
  }
}