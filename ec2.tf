resource "aws_instance" "wp" {
  ami           = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  # This uses the "wordpress-key" from your terraform.tfvars
  key_name = var.key_name 

  # This part sends your database info into the userdata.sh script
  user_data = templatefile("${path.module}/userdata.sh", {
    DB_NAME     = var.db_name
    DB_USER     = var.db_user
    DB_PASSWORD = var.db_password
    DB_HOST     = aws_db_instance.wordpress.address
  })

  tags = {
    Name = "WordPress-EC2"
    App  = "WordPress"
    Env  = "Dev"
  }
}