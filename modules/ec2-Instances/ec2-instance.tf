resource "aws_instance" "webserver" {

    ami = "ami-07ffb2f4d65357b42"
    instance_type = "t2.micro"
    subnet_id = "subnet-04d91589fcfbde1e3"
   

    tags = {
      "Name" = "webserver"
    }
  
}