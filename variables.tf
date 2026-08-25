variable "aws_region" {
  description = "AWS region where infrastructure will be created"
  type        = string
  default     = "ap-northeast-2"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "terraform-seoul"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_1_cidr" {
  description = "CIDR for first public subnet"
  type        = string
  default     = "10.20.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR for second public subnet"
  type        = string
  default     = "10.20.2.0/24"
}

variable "availability_zone_1" {
  description = "First Seoul availability zone"
  type        = string
  default     = "ap-northeast-2a"
}

variable "availability_zone_2" {
  description = "Second Seoul availability zone"
  type        = string
  default     = "ap-northeast-2b"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = "terraform-seoul-key"
}

variable "public_key" {
  description = "SSH public key used to create the EC2 key pair"
  type        = string
  sensitive   = false
}
