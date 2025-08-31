# provider.tf

# Specify the provider and access details
provider "aws" {
  #profile = "default"
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = terraform.workspace
    }
  }
}
