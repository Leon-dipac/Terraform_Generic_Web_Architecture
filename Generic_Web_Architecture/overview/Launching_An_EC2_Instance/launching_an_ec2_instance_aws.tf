/*
   The official documentation can be found using :

     Link : https://registry.terraform.io/providers/hashicorp/aws/latest/docs

    Complete Terraform Course - From BEGINNER to PRO :

    1- Link : https://www.youtube.com/watch?v=7xngnjfIlK4

    This hands on is at 25 min 00 Seconds of the video.

*/

// Let's specify which cloud provider we are going to use :
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Let's define a default region for that required Provider :
provider "aws" {
  region = "us-east-1"
}

// All the defined resources will be launched in my default region if not specified :

# Create an EC2 instance known as "my_terraform_instance" within my Default VPC :

// Link : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "my_terraform_instance" {
    /*
       The Amazon Machine Image known as AMI is not just an " Operating System " but a machine Image 
       containing the full set of information required to create an EC2 virtual machine instance.
    */
    ami = "ami-052efd3df9dad4825" # Ubuntu Server 22.04 LTS (HVM),EBS General Purpose (SSD) Volume Type.
    instance_type = "t2.micro"
}