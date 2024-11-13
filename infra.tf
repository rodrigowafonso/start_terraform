resource "aws_vpc" "vpc_start_tf" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_nome
  }
}

resource "aws_subnet" "subnet_start_tf" {
  vpc_id = aws_vpc.vpc_start_tf.id
  cidr_block = var.subnet_cidr_block

  tags = {
    Name = var.subnet_nome
  }
}

resource "aws_internet_gateway" "internet_gw_start_tf" {
  tags = {
    Name = var.internet_gw_nome
  }
}

resource "aws_internet_gateway_attachment" "internet_gw_attach" {
  internet_gateway_id = aws_internet_gateway.internet_gw_start_tf.id
  vpc_id = aws_vpc.vpc_start_tf.id
}

resource "aws_route_table" "rt_start_tf" {
  vpc_id = aws_vpc.vpc_start_tf.id

  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.internet_gw_start_tf.id
  }

  tags = {
    Name = var.internet_gw_nome
  }
}

resource "aws_route_table_association" "rt_start_attach" {
  subnet_id = aws_subnet.subnet_start_tf.id
  route_table_id = aws_route_table.rt_start_tf.id
}

resource "aws_security_group" "sg_start_tf" {
  name        = "sg_start_tf"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc_start_tf.id

  tags = {
    Name = var.sg_instancia_devpos-tf
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_ingress_tf" {
  security_group_id = aws_security_group.sg_start_tf.id
  cidr_ipv4 = aws_vpc.vpc_start_tf.cidr_block
  from_port = "22"
  ip_protocol = "tcp"
  to_port = "22"
}

resource "aws_vpc_security_group_egress_rule" "sg_egress_tf" {
  security_group_id = aws_security_group.sg_start_tf.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}