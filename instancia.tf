# Garantindo que será utilizado a Key Pair Devops Rodrigo Afonso
data "aws_key_pair" "rwa_chave_tf" {
  key_name = var.key_pair_nome
}

resource "aws_instance" "srv_devops_tf" {
  ami = var.instancia_ec2_image
  instance_type = var.instancia_ec2_tipo
  subnet_id = aws_subnet.subnet_start_tf.id
  vpc_security_group_ids = [aws_security_group.sg_start_tf.id] 
  associate_public_ip_address = true
  
  tags = {
    Name = var.instancia_ec2_nome
    Projeto = "Devops"
  }
}

output "srv_devops_tf_id" {
    description = "ID da Instância"  
    value = aws_instance.srv_devops_tf.id
}
output "srv_devops_tf_pip" {
  description = "IP Público Instância"
  value = aws_instance.srv_devops_tf.public_ip
}
