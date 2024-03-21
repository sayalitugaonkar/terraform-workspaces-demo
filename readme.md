# Terraform workspaces demo

This project demonstrates the efficient use of workspaces.

3 new terraform workspaces were created for different environment `prod,staging or dev`

The project also includes the technique to control the conditional creation of resources

Suppose you only want to create some resources in the dev/staging workspace and then test them before applying to production environment.

The ternary operator is used for the same:-

    `condition ?` this if the condition is true : this if the condition is false

For example in the project:
`count  = terraform.workspace == "staging" || terraform.workspace == "dev" ? 1 : 0`

For the above condition, count=1 if `(terraform.workspace == "staging" || terraform.workspace == "dev")` otherwise count=0

ec2-module/s3-bucket-module is called depending on the workspace and the corresponding resources are created depending on value of terraform.workspace

No resources are created in default workspace


### environments.tf
==============
This project also demonstrates the efficient use of Terraform locals. 

It is helpful to avoid repeating the same values or expressions multiple times in a configuration

Usecase: lets say for the you want to deploy bigger size instance for the production and small size instances for dev/staging.


### Terraform modules:

A Terraform module is a collection of standard configuration files in its own directory. Those encapsulate groups of resources dedicated to a task, reducing the amount of code you need to develop for similar infrastructure components.

This project also demonstrates the module to module comminucation [root-child, child-child]

The project consists of 3 modules:

1) vpc-module:

It creates custom VPC depending upon terraform workspace `staging,dev or prod`

Each vpc should be created from separate terraform workspace

It also creates private subnets, public subnets, route tables, Internet gateway, NAT gateway for communication

Details including names for each vpc, subnet are defined in locals block

Names for the resources are fetched per workspace via locals `Terraform Join Function`

2) ec2-module:

This module will launch EC2 instance only in staging and dev workspace

Currently, Security group has open SSH port for the communication.

You can restrict the rules as per the requirements

Instance types for different workspaces are defined in locals block

Names for the resources are fetched per workspace via locals `Terraform Join Function`


3) s3-bucket-module
This module will launch S3 bucket only in staging and dev workspace with lifecycle rule of 30 days.
