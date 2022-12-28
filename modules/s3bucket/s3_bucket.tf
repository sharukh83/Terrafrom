resource "aws_s3_bucket" "myfirstbuvket" {

    bucket = "mybucket28120221"
    acl = "private"
    versioning {
      enabled = true
    }
    
    tags = {
        Name = "mybucket2022"
    }
  
}
  
