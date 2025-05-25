terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "github-oidc-actions-tfstate"
    key     = "terraform.tfstate"
  }
}