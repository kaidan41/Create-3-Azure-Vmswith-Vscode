# Create a Variables
variable "rgname" {
  type        = string
  description = "resource grouop name"
  default     = "RG-ISTIO"
}
variable "location" {
  type        = string
  description = "location name"
  default     = "eastus2"
}

variable "virtual_network_name" {
  type        = string
  description = "Virtual Network Name"
  default     = "Vnet-iSTIO"
}

variable "subnet" {
  type        = string
  description = "Subnet"
  default     = "Internal"
}

variable "network_interface" {
  type        = string
  description = "Network Interface"
  default     = "Vnet-ISTIO"
}

variable "public_ip" {
  type        = list(string)
  description = "Ip publico"
  default     = ["pip-istio", "pip-istio", "pip-istio"]
}

variable "vm_name" {
  type        = list(string)
  description = "VMs Name"
  default     = ["ISTIO-VM01", "ISTIO-VM02", "ISTIO-VM03"]
}

variable "nsg" {
  type        = string
  description = "nsg"
  default     = "NSG-ISTIO"
}