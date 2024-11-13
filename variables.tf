variable "aws_regiao" {
    type = string
    default = "us-east-1"
}

##### Variáveis de Infraestrutura

variable "vpc_nome" {
  type = string
  default = "vpc_start_tf"
}

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_nome" {
    type = string
    default = "subnet_start_tf"
}

variable "subnet_cidr_block" {
  type = string
  default = "10.0.1.0/24"
}

variable "internet_gw_nome" {
  type = string
  default = "i_gw_start_tf"
}

variable "rt_cidr_block" {
  type = string
  default = "0.0.0.0/0"
}

####### Variáveis da Instância

variable "instancia_ec2_image" {
  type = string
  default = "ami-0866a3c8686eaeeba"
}

variable "instancia_ec2_tipo" {
  type = string
  default = "t2.micro"
}

variable "instancia_ec2_nome" {
    type = string
    default = "srv-devops-tf"
}

variable "sg_instancia_devpos-tf" {
  type = string
  default = "sg_instancia_devpos-tf"
}

variable "key_pair_nome" {
  type = string
  default = "key_devops_rodrigoafonso"
}