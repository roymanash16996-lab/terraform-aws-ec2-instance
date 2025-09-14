################################################################################
# Creation Configurations
################################################################################

variable "create_instance" {
  description = "Flag to create an EC2 instance"
  type        = bool
  default     = true
}

# variable "instance_count" {
#   description = "Number of EC2 instances to create"
#   type        = number
#   default     = 1  
# }

################################################################################
# Network Configurations
################################################################################

variable "region" {
  description = "AWS region to deploy the instance. Default is the region configured in AWS provider."
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "ID of the VPC where the instance will be deployed. If not provided, the default VPC will be used."
  type        = string
  default     = ""
}

variable "subnet_type" {
  description = "Type of subnet for the instance. Options are 'public', 'private-with-nat', 'private-isolated'. Default is 'public'. Options are case-sensitive and need to be mentioned in Subnet name."
  type        = string
  default     = ""
}

variable "availability_zone" {
  description = "Availability zone for the EC2 instance. Default is the first availability zone of the selected VPC."
  type        = string
  default     = ""
}

################################################################################
# Operating System configurations
################################################################################

variable "ami" {
  description = "The AMI to use for the instance. By default it is the AMI provided by Amazon with Ubuntu 22.04"
  type        = string
  default     = ""
}

variable "os-type" {
  description = "Operating system type for the instance. Options are 'ubuntu-20.04', 'ubuntu-22.04', 'ubuntu-23.04', 'ubuntu-23.10', 'ubuntu-24.04', 'ubuntu-25.04'"
  type        = string
  default     = "ubuntu-22.04"

  validation {
    condition     = contains(["ubuntu-20.04", "ubuntu-22.04", "ubuntu-23.04", "ubuntu-23.10", "ubuntu-24.04", "ubuntu-25.04"], var.os-type)
    error_message = "Invalid OS type. Allowed values are 'ubuntu-20.04', 'ubuntu-22.04', 'ubuntu-23.04', 'ubuntu-23.10', 'ubuntu-24.04', 'ubuntu-25.04'."
  }
}

variable "architecture" {
  description = "Architecture type for the instance. Options are 'amd64' or 'arm64'"
  type        = string
  default     = "amd64"

  validation {
    condition     = contains(["amd64", "arm64"], var.architecture)
    error_message = "Invalid architecture type. Allowed values are 'amd64' or 'arm64'."
  }
}

################################################################################
# Instance configurations
################################################################################

variable "enable-public-ip" {
  description = "Flag to enable public IP for the instance"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t3.micro"
}