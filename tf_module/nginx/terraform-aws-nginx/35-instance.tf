# instance

resource "aws_instance" "this" {
  ami           = var.ami_id != "" ? var.ami_id : data.aws_ami.this.id
  instance_type = var.instance_type
  subnet_id     = data.terraform_remote_state.vpc.outputs.private_subnet_ids[0]
  user_data     = var.user_data != "" ? var.user_data : data.template_file.setup.rendered
  key_name      = var.key_name != "" ? var.key_name : var.name


  vpc_security_group_ids = [
    aws_security_group.this.id
  ]

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    delete_on_termination = var.delete_on_termination
  }

  tags = {
    Name = var.name
  }


}
