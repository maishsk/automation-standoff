resource "aws_vpc" "testvpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "${var.project_name}"
    }
}
