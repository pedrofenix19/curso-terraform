terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

  }
}

provider "local" {
  # Configuration options
}

provider "aws" {
  region = "us-east-1"
}