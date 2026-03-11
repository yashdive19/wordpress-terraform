resource "aws_db_subnet_group" "db_subnet" {
  name       = "wordpress-db-subnet"
  subnet_ids = [
    aws_subnet.public.id,
    aws_subnet.private.id
  ]

  tags = {
    Name = "WordPress-DB-Subnet"
  }

  lifecycle {
    ignore_changes = [name]
  }
}

resource "aws_db_instance" "wordpress" {
  allocated_storage      = 20
  storage_type           = "gp2" # Standard SSD storage
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name
  username               = var.db_user
  password               = var.db_password
  skip_final_snapshot    = true
  publicly_accessible    = false # Keeps your database secure
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  multi_az               = false # Set to false to keep costs low/free tier friendly

  tags = {
    Name = "WordPress-RDS"
    App  = "WordPress"
    Env  = "Dev"
  }
}