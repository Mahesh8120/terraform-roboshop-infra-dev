variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "sg_tags" {
  default = {
    name = "mongodb"
}
}

variable "common_tags" {
  default = {
    name = "roboshop"
    environment = "dev"
    terraform = "true"
  }
}

variable "sg_name" {
  default = {}
}
  