resource "random_pet" "this" {
  length = 2
}

variable "domain" {
    type    = string
    default = "tozastation"
}

variable "region" {
    type    = string
    default = "ap-northeast-1"
}

variable "vpc_cidr_block" {
    type    = string
    default = "10.0.0.0/16"
}

variable "num_subnets" {
    type    = number
    default = 2
}

variable "instance_type" {
    type    = string
    default = "t2.small"
}

variable "desired_capacity" {
    type    = number
    default = 2
}

variable "max_size" {
    type    = number
    default = 2
}

variable "min_size" {
    type    = number
    default = 2
}

locals {
    cluster_name     = "${var.domain}-${random_pet.this.id}"
    cluster_version  = "1.16.8"
    node_group_name  = "${var.domain}-node-${random_pet.this.id}"
    master_user_name = "${var.domain}-master-${random_pet.this.id}"
    worker_user_name = "${var.domain}-worker-${random_pet.this.id}"

    default_tags  = {
        ENV       = "dev"
        ORG       = var.domain  
        TERRAFORM = true
    }
}