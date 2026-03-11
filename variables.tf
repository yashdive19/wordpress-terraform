variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "ap-south-1"
}

variable "db_name" {
  description = "WordPress database name"
  type        = string
  default     = "wordpressdb"
}

variable "db_user" {
  description = "WordPress database username"
  type        = string
  default     = "wpuser"
}

variable "db_password" {
  description = "WordPress database password"
  type        = string
  default     = null
  nullable    = true
  sensitive   = true
}

variable "key_name" {
  description = "EC2 key pair name for SSH access"
  type        = string
  default     = null
  nullable    = true
}

variable "instance_type" {
  description = "EC2 instance type for WordPress"
  type        = string
  default     = "t2.micro"
}

variable "ssh_cidr" {
  description = "CIDR allowed for SSH access when enabled"
  type        = string
  default     = "0.0.0.0/0"
}

variable "enable_ssh" {
  description = "Enable SSH access to the EC2 instance"
  type        = bool
  default     = false
}
