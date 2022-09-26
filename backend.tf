#should run the terraform init after changing any of these 

terraform {
  backend "s3" {
    bucket         = "thesourceonemoustafa" #the bucket name 
    key            = "terraform.tfstate"    #path of the file 
    region         = "us-east-1"
    dynamodb_table = "NEW_Table"
  }
}
