resource "aws_db_subnet_group" "main" {
  name       = "main-db-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags       = { Name = "Main DB Subnet Group" }
}

resource "aws_security_group" "rds_sg" {
  name   = "rds-security-group"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"] # Restricted to your VPC range
  }
}

resource "aws_db_instance" "postgresql" {
  identifier             = "novacart-production-db"
  engine                 = "postgres"
  engine_version         = "16"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible    = false

  # Reliability
  skip_final_snapshot = true # Set to false in actual production
  multi_az            = true # HIGH AVAILABILITY: Spreads across AZs
  
  tags = { Name = "NovaCart-Postgres-DB" }
}
