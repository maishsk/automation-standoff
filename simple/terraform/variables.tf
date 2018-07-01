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
