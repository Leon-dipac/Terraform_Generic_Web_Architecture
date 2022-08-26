## Install Terraform

Official installation instructions from HashiCorp: https://learn.hashicorp.com/tutorials/terraform/install-cli

## AWS Account Setup

AWS Terraform provider documentation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication

1. create non-root AWS user
2. Add the necessary IAM roles (e.g. AmazonEC2FullAccess)
3. Save Access key + secret key (or use AWS CLI `aws configure` -- https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

## Hello World Example : This is basically the Terraform configuration file written to launch a Basic EC2 instance on AWS.

When using Terraform, you write your project using a " Terraform Configuration " file and a " Terraform State " file which are used to define the infrastructure that you would like to provision in the cloud.

1. To provision an EC2 instance on AWS, please open a new terminal and navigate to the folder or directory
   where the written instructions or code for your resource configuration on AWS is written. That code is
   called " launching_an_ec2_instance_aws.tf " which contains minimal configuration to provision an EC2 instance.

Then run the following command ( This represents the general basic Terraform usage sequence ):

2. `terraform init` : which will initialize the Local or Remote backEnd through the current working directory.
   Basically, this step initialize your project. Terraform Cloud can be one option to host our Terraform State File in a Remote BackEnd for us and manage things like permissions for us.

   ## Let's see the sequence of events that happen when we run " terraform init "

   NB: When we run the " terraform init " command that goes off and actually downloads the associated providers that we defined in that terraform block. So, it's going to get the code for the AWS provider from the Terraform Registry; it actually downloads that and puts it into our working directory which will result in a " .terraform " directory available in our project. We also now have a " .terraform.lock.hcl " file which contains information about the specific dependencies and providers that are installed within this workspace. Furthermore, it will go and download all those modules associated with our terraform configuration files in case we are using modules with Terraform to make our code reusable.

   RQ: The Terraform State File is terraform's representation of the world. So, it is a JSON file containing information about every single resource and/or data object that we have deployed using Terraform. Resources can be anything in the cloud provider. Finally, the state file will contain Sensitive information such ad database password. Therefore, we need to protect the state file accordingly ; make sure that it's encrypted and the permissions are set so that only the correct set of individuals would have access to it.

   You can also store the state file locally or remotely. When you first install terraform, I believe that the default is for it to be stored locally. So it will be within the working directory of our project. But in case where you have multiple people working on the project in the company, you can store that state file remotely usually in an Object Store like an Amazon S3 Bucket or Google Cloud Storage.

   Terraform Cloud can be one option to host our Terraform State File in a Remote BackEnd for us and manage things like permissions for us. We can also self manage a remote backend just to store those state files by using something like Amazon S3 Bucket or Google Cloud Storage. This is a great approach because it allows us to encrypt all the sensitive data that would be within that file and gets it off of our local system. It also allow multiple people to all interact with the same remote backEnd which makes collaboration with other engineers easily. It allows us to automate things because we can run other automation pipelines that can interact with this remote state as well.

   The downside of this remote backend approach is : It does add " increased complexity " compared to the local backend. For newbies in Terraform, it's much easier to start with a Local BackEnd.

3. `terraform plan` : That will go ahead and query the AWS API and compare what is current written in the
   Terraform Configuration file ( the set of " .tf " files ) that represents the " Desired state " to what is
   currently deployed through your Terraform State File which represents the " Actual state of the world ". Then, the terminal will display if the defined resources do already exist or not.

   Basically, this step will review the changes Terraform will make to your actual infrastructure deployed in AWS Cloud. This command will take your configuration and check it against the currently deployed state of the world and your state file and will figure out the set of the sequence of the set of things that need to happen to provision that infrastructure.

4. `terraform apply` : will create all the defined resources with its attributes. Terraform will provision just the difference highlighted when running " terraform plan " command between your desired state and your actual state by creating those resources into your infrastructure. Furthermore, this command will also updates your Terraform State File available in your project.

Basically, the " terraform apply " command takes that set of commands and applies them so that you end up with the infrastructure you want.

5. `terraform destroy` : will destroy or clean up all the resources created or launched using this Terraform Configuration file.

## Pushing your work to a Remote Repository such as GitHub :

1. Create a new GitHub Repository called " Terraform_Generic_Web_Architecture " and give a description of " Provisioning the infrastructure used by a simple web application into AWS Cloud Environment through Terraform." while making the repository " Public "

2. Open your VS Code Terminal on the folder where your project is located or stored and run the following commands :

   `$ git init`

   `$ git status`

   `$ git add .`

   `$ git commit -m " first commit "`

   `$ git remote add origin https://github.com/Leon-dipac/Terraform_Generic_Web_Architecture.git `

   `$ git branch -M Leon_Branch `

   `$ git push -u origin Leon_Branch `
