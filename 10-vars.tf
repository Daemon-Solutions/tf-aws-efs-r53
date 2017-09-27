variable "prefix" {
  description = "The name prefix for the EFS"
  type = "string"
  default = "efs"
}

variable "name" {
  description = "Name for the resources created by this module, interpolated with 'prefix'"
  type = "string"
}

variable "subnets" {
  description = "Comma separated string of three subnets to distribute the EFS over"
  type = "string"
}

variable "security_groups" {
  description = "Comma separated string of three security group IDs to assign to the mount targets"
  type = "string"
}

variable "r53_zone_id" {
  description = "The ID of the Route 53 zone you wish to create records in for this EFS"
  type = "string"
}

variable "r53_domain" {
  description = "The domain suffixes you wish to use for this EFS e.g. 'mydomain.com'"
  type = "string"
}

variable "create_cnames" {  
  description = "Bit indicating whether to create CNAME records for this EFS"
  type = "string"
  default = 0
}

variable "availability_zones" {
  description = "Comma seperated list of availability zones to span this EFS over"
  type = "string"
  default = "eu-west-1b,eu-west-1c,eu-west-1d"
}

variable "efs_performance" { 
  description = "The file system performance mode, can be either 'generalPurpose' or 'maxIO'"
  type = "string"
  default = "generalPurpose"
}
