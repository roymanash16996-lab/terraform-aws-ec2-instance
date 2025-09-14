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

variable "os" {
  description = "Operating system for the instance. Currently only 'ubuntu' is supported."
  type        = string
  default     = "ubuntu"

  validation {
    condition     = contains(["ubuntu"], var.os)
    error_message = "Invalid OS. Only 'ubuntu' is supported currently."
  }
  
}

variable "os-version" {
  description = <<-EOT
    Operating system version for the instance.

    Supported Ubuntu versions:
      - 20.04 (Focal Fossa LTS)
      - 22.04 (Jammy Jellyfish LTS)
      - 23.04 (Lunar Lobster)
      - 23.10 (Mantic Minotaur)
      - 24.04 (Noble Numbat LTS)
      - 25.04 (Plucky Puffin)

      - LTS (Long Term Support) releases (20.04, 22.04, 24.04) receive 5 years of standard support and can be extended with Ubuntu Pro for up to 10 years. Interim releases (23.04, 23.10, 25.04) are supported for 9 months and intended for rapid development or testing.
      
    Supported Amazon Linux versions:
      - 2 (Amazon Linux 2, LTS)
      - 2023 (Amazon Linux 2023, current generation)

      - Amazon Linux 2 is supported with regular updates as an AWS LTS platform. Amazon Linux 2023 is the latest release with ongoing updates and compatibility with AWS services.

    Please choose the value based on your requirements and refer to official documentation for extended maintenance options.
  EOT
  type        = string
  default     = "22-04"

  validation {
    condition     = contains(["20-04", "22-04", "23-04", "23-10", "24-04", "25-04"], var.os-version)
    error_message = "Invalid OS type. Allowed values are '20-04', '22-04', '23-04', '23-10', '24-04', '25-04'."
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