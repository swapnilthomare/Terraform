terraform {

required_version = "~>1.4.4"

  required_providers {
    myawscloud = {
      source  = "hashicorp/aws"
      version = "~> 4.61.0"
    }
  }
}