# backend.tf

terraform {
  backend "s3" {
    bucket = "amzn-bitoasis-candidate-bucket"
    key    = "assessment.tfstate"
    region = "us-east-2"
    
    # dynamodb_table = "terraform-lock-table" 
  }
}
