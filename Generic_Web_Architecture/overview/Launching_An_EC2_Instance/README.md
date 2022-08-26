## Install Terraform

Official installation instructions from HashiCorp: https://learn.hashicorp.com/tutorials/terraform/install-cli

## AWS Account Setup

AWS Terraform provider documentation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication

1. create non-root AWS user
2. Add the necessary IAM roles (e.g. AmazonEC2FullAccess)
3. Save Access key + secret key (or use AWS CLI `aws configure` -- https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

## Hello World : This is basically the Terraform configuration file written to launch a Basic EC2 instance on AWS

When using Terraform, you write your project using a " Terraform Configuration " file and a " Terraform State " file which are used to define the infrastructure that you would like to provision in the cloud.

1. To provision an EC2 instance on AWS, please open a new terminal and navigate to the folder or directory
   where the written instructions or code for your resource configuration on AWS is written. That code is
   called " launching_an_ec2_instance_aws.tf " which contains minimal configuration to provision an EC2 instance.

Then run the following command :

2. `terraform init` : which will initialize the backEnd through the current working directory.

3. `terraform plan` : That will go ahead and query the AWS API and compare what is current written in the
   Terraform Configuration file ( the set of " .tf " files ) that represents the " Desired state " to what is
   currently deployed through your Terraform State File. Then, the terminal will display if the defined resources do already exist or not.

   Basically, this step will review the changes Terraform will make to your actual infrastructure deployed in AWS Cloud.

4. `terraform apply` : will create all the defined resources with its attributes. Terraform will provision just the difference highlighted when running " terraform plan " command between your desired state and your actual state by creating those resources into your infrastructure. Furthermore, this command will also updates your Terraform State File available in your project.

5. `terraform destroy` : will destroy or clean up all the resources created or launched using this Terraform Configuration file.
