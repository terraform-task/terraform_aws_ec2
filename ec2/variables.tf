variable "instance_type" {
  type        = string
  default     = ""
  description = "instance type for the EC2 instance"
}

variable "aws_region" {
  type        = string
  default     = ""
  description = "AWS region for the EC2 instance"
}

variable "security_group_name" {
  type        = string
  default     = ""
  description = "Name of the security group"
}

variable "ssh_cidr_blocks" {
  type        = list(string)
  default     = [""]
  description = "CIDR blocks for SSH access"    
}

variable "http_cidr_blocks" {
  type        = list(string)
  default     = [""]
  description = "CIDR blocks for HTTP access"
}

variable "cluster_name" {
  type        = string
  default     = ""
  description = "Name of the EKS cluster"
}

variable "vpc_cidr" {}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}

variable "key_name" {
  type        = string
  default     = ""
  description = "Name of the key pair to use for the EC2 instance"
}