resource "azurerm_virtual_network" "vnet-name" {
  name                = var.vnetname
  location            = var.location
  resource_group_name = var.resourcegroup
  address_space       = var.addressspace

  }
resource "azurerm_subnet" "aks-subnet" {
  name                 = var.subnet
  resource_group_name  = var.resourcegroup
  virtual_network_name = azurerm_virtual_network.vnet-name.name
  address_prefixes     = var.addressprefixes
}
  
  
resource "azurerm_kubernetes_cluster" "example" {

    name                                = var.clustername
	location                            = var.location
	kubernetes_version                  = var.k8version
	resource_group_name                 = var.resourcegroup
	dns_prefix                          = var.dns_prefix
	private_cluster_enabled             = false



    default_node_pool {
	    
        name                         = var.poolname
		node_count                   = var.nodecount
		enable_auto_scaling          = true
		max_count                    = var.maxcount
		min_count                    = var.mincount
		type                         = "VirtualMachineScaleSets"
		vm_size                      = var.vmsize
		os_disk_size_gb              = var.osdisksize
		vnet_subnet_id               = azurerm_subnet.aks-subnet.id 
       
    }

 identity {
    type = "SystemAssigned"
  }


    network_profile {
        dns_service_ip     =  var.dnsserviceip
        docker_bridge_cidr =  var.dockercidr
        ip_versions        = []
        load_balancer_sku  = "standard"
        network_plugin     = "azure"
        outbound_type      = "loadBalancer"
        service_cidr       =  var.servicecidr

     
    }

    timeouts {}

}	

