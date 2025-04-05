resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")

  tags = {
    name = "hello"
    team = "devops"
  }
}

terraform {
  backend "s3" {
    bucket = "kaizen-ayas"
    key    = "terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table = "lock"
    use_lockfile = true 
  }
}
