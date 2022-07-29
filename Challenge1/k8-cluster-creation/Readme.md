1. The Directory files help to create **AKS cluster** in Azure using terraform
2. **Main.tf** file contains resource creation code for cluster and node pool which uses Virtual network and subnetwork
3. **variables.tf** container variables which are being used in script
4. **terraform.auto.tfvars** file contains actual values which will be passed to main.tf file
5. **provider.tf** files containes Subscription id and Service principal details to authentication & authorization to azure cloud.
6. **backend.tf** contain information like subscription id , storage account name , container name and state file name once terraform resources gets cretaed the **terraform.tfstate** will be stored in storage account backend.The input parameters hardcoded need to be modified based on requirement
7. All confidential information have replaced with asterik symbols
8. Terraform commands to execute after cloning the code Commands:
**terraform init** -> to initialise terraform whcih internally download provider plungins and modules other things
**terraform plan** -> to generate plan and see wt resource getting create
**terraform apply --auto-approve** -> Apply the terraform plan to create resources.
