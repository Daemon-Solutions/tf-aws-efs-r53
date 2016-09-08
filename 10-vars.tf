variable "prefix" {}
variable "name" {}
variable "subnets" {}
variable "security_groups" {}
variable "r53_zone_id" { default = "" }
variable "r53_domain" { default = "" }
variable "create_cnames" { default = 0 }
variable "availability_zones" { default = "" }
variable "efs_performance" { default = "generalPurpose" }
