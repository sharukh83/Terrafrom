provider "aws" {

    region = "ap-south-1"
  
}

module "webserver" {
    source = "./modules/ec2-Instances"
  
}

module "s3bucket" {
    source = "./modules/s3bucket"
  
}

module "eks" {
    source = "./modules/eks"
  
}


terraform {
  backend "s3" {
    bucket = "mybucket28120221"
    key = "terraform.tfstate"
    region = "ap-south-1"

  }
}
