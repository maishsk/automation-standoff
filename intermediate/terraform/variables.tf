variable "region" {
        default = "us-east-2"
}
variable "profile" {
    description = "AWS credentials profile you want to use"
    default     = "default"
}
variable "vpc_cidr" {
    description = "The CIDR block to be used in the VPC"
    default     = "192.168.90.0/24"
}
variable "project_name" {
    description = "The Name of the VPC"
    default     = "testvpc"
}
variable "pub1_cidr" {
    description = "The CIDR block for the public subnet in us-east-2a"
    default     = "192.168.90.0/26"
}
variable "pub2_cidr" {
    description = "The CIDR block for the public subnet in us-east-2b"
    default     = "192.168.90.64/26"
}
variable "private1_cidr" {
    description = "The CIDR block for the private subnet in us-east-2a"
    default     = "192.168.90.128/26"
}
variable "private2_cidr" {
    description = "The CIDR block for the private subnet in us-east-2b"
    default     = "192.168.90.192/26"
}
variable "pub1_name" {
    description = "The name tag for the public subnet in us-east-2a"
    default     = "Public Subnet (AZ1)"
}
variable "pub2_name" {
    description = "The name tag for the public subnet in us-east-2b"
    default     = "Public Subnet (AZ2)"
}
variable "priv1_name" {
    description = "The name tag for the private subnet in us-east-2a"
    default     = "Private Subnet (AZ1)"
}
variable "priv2_name" {
    description = "The name tag for the private subnet in us-east-2b"
    default     = "Private Subnet (AZ2)"
}
variable "az1" {
    description = "The Availability zone for AZ1"
    default     = "us-east-2a"
}

variable "az2" {
    description = "The Availability zone for AZ2"
    default     = "us-east-2b"
}
