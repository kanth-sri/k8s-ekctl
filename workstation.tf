module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "workstation"
  ami = data.aws_ami.ami_id.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0db852f21feb30740"]
  subnet_id              = "subnet-05d358515b76d752e"
  user_data = file("installation.sh")
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}