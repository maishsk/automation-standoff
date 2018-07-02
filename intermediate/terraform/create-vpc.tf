resource "aws_vpc" "testvpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "${var.project_name}"
    }
}

resource "aws_subnet" "pub1_subnet" {
    vpc_id = "${aws_vpc.testvpc.id}"
    cidr_block = "${var.pub1_cidr}"
    availability_zone = "${var.az1}"
    tags {
        Name = "${var.pub1_name}"
    }
}

resource "aws_subnet" "pub2_subnet" {
    vpc_id = "${aws_vpc.testvpc.id}"
    cidr_block = "${var.pub2_cidr}"
    availability_zone = "${var.az2}"
    tags {
        Name = "${var.pub2_name}"
    }
}

resource "aws_subnet" "priv1_subnet" {
    vpc_id = "${aws_vpc.testvpc.id}"
    cidr_block = "${var.private1_cidr}"
    availability_zone = "${var.az1}"
    tags {
        Name = "${var.priv1_name}"
    }
}

resource "aws_subnet" "priv2_subnet" {
    vpc_id = "${aws_vpc.testvpc.id}"
    cidr_block = "${var.private2_cidr}"
    availability_zone = "${var.az2}"
    tags {
        Name = "${var.priv2_name}"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = "${aws_vpc.testvpc.id}"
    tags {
        Name = "${var.project_name}"
    }
}

resource "aws_eip" "eip1" {
    vpc = true
}

resource "aws_eip" "eip2" {
    vpc = true
}

resource "aws_nat_gateway" "nat_az1" {
    allocation_id = "${aws_eip.eip1.id}"
    subnet_id = "${aws_subnet.pub1_subnet.id}"
}

resource "aws_nat_gateway" "nat_az2" {
    allocation_id = "${aws_eip.eip2.id}"
    subnet_id = "${aws_subnet.pub2_subnet.id}"
}

resource "aws_route_table" "pub_rt" {
    vpc_id = "${aws_vpc.testvpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
    tags {
        Name = "Public Route Table"
    }
}

resource "aws_route_table_association" "pub_rt_association1" {
    subnet_id = "${aws_subnet.pub1_subnet.id}"
    route_table_id = "${aws_route_table.pub_rt.id}"
}

resource "aws_route_table_association" "pub_rt_association2" {
    subnet_id = "${aws_subnet.pub2_subnet.id}"
    route_table_id = "${aws_route_table.pub_rt.id}"
}

resource "aws_route_table" "priv1_rt" {
    vpc_id = "${aws_vpc.testvpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_nat_gateway.nat_az1.id}"
    }
    tags {
        Name = "Private Route Table (AZ1)"
    }
}

resource "aws_route_table" "priv2_rt" {
    vpc_id = "${aws_vpc.testvpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_nat_gateway.nat_az2.id}"
    }
    tags {
        Name = "Private Route Table (AZ2)"
    }
}

resource "aws_route_table_association" "priv1_rt_association" {
    subnet_id = "${aws_subnet.priv1_subnet.id}"
    route_table_id = "${aws_route_table.priv1_rt.id}"
}

resource "aws_route_table_association" "priv2_rt_association" {
    subnet_id = "${aws_subnet.priv2_subnet.id}"
    route_table_id = "${aws_route_table.priv2_rt.id}"
}
