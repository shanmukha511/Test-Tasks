1. The Directory files help to create K8s deployements in Azure aks using terraform
2. Main.tf file contains resource to be created like 3 k8 deployments and 3 services.One deployment is backend redis and service is clusterip, other deployment contains application logic and cluster ip service and 3rd deployment is nginx which is front end and service is loadbalance.
3. backend.tf contain information like subscription id , storage account name , container name and state file name once terraform resources gets cretaed the terraform.tfstatewill be stored in storage account backend.The input parameters hardcoded need to be modified based on requirement
4. All confidential information have replaced with asterik symbols
5. Terraform commands to execute after cloning the code Commands:

Before doing terraform initialisation we need to connect the aks cluster using kubeconfig which gets generated using below commands.Post that we can deploy the tf configuration

az account set --subscription **********************
az aks get-credentials --resource-group ***** --name **** -------> Generates Kube config file which helps to authenticate and authorize to k8 cluster


terraform init -> to initialise terraform whcih internally download provider plungins and modules other things
terraform plan -> to generate plan and see wt resource getting create
terraform apply --auto-approve -> Apply the terraform plan to create resources.

Once Terraform Apply command executed successfully need to execute below commands to access applications

kubectl get deploy

kubectl get svc

Please take the loadbalancer ip of service snappass-nginx and hit on browser example https://20.102.34.32/ the ssl is not enabled so you may receive warning like not secure click on advance you will be able see application to share secrets.