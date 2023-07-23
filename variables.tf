variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "newRG"
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
  default     = "newnsg"
}

variable "location" {
  description = "Azure region location"
  type        = string
  default     = "eastus"
}

variable "security_rules" {
  description = "List of security rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_ranges         = string
    destination_port_ranges    = string
    source_address_prefix    = optional(string)
    destination_address_prefix = optional(string)
    source_address_prefixes    = optional(list(string))
    destination_address_prefixes = optional(list(string))
  }))
  default = []
}


