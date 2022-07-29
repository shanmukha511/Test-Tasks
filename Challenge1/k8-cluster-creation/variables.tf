variable "vnetname" {
  type        = string
  description = "The Virtual Network Name."
}

variable "location" {
  type        = string
  description = "The location to create the resource."
}

variable "addressspace" {
  description = "CIDR Range for Vnet."
}

variable "resourcegroup" {
  description = "The Resource Group Name"
}

variable "subnet" {
  type        = string
  description = "The Subnet Name"
}

variable "addressprefixes" {
  description = "CIDR Range for Subnet."
}


variable "clustername" {
  type        = string
  description = "The Cluster Name"
}

variable "k8version" {
  type        = number
  description = "Kubernetes Version"
}

variable "maxcount" {
  type        = number
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
}

variable "mincount" {
  type        = number
  description = "Minimum number of nodes in the NodePool"
}

variable "osdisksize" {
  type        = number
  description = "Size of the os disk."
}

variable "poolname" {
  type        = string
  description = "The NodePool Name"
}

variable "nodecount" {
  type        = number
  description = "The Node Count default node pool."
}

variable "dns_prefix" {
  type        = string
  description = "DNS Prefix name"
}


variable "vmsize" {
  type        = string
  description = "VM Size"
}


variable "dnsserviceip" {
  description = "The dns service ip"
}

variable "dockercidr" {
  description = "Docker CIDR Range"
}


variable "servicecidr" {
  description = "Services CIDR Range"
}

