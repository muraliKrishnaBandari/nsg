terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.65.0"
    }
  }
}

#sentinel {
#  enforcement {
#    policy = "./policies/security_rules_policy.sentinel"
#  }
#}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

#variable "security_rules" {
#  description = "List of security rules"
#  type        = list(object({
#    name                       = string
#    priority                   = number
#    direction                  = string
#    access                     = string
#    protocol                   = string
#    source_port_range          = string
#    destination_port_range     = string
#    source_address_prefix      = string
#    destination_address_prefix = string
#  }))
#}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

data "azurerm_resource_group" "example_data" {
  name = azurerm_resource_group.example.name
}

# Create a network security group within the resource group
resource "azurerm_network_security_group" "example" {
  name                = var.nsg_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_ranges
      destination_port_range     = security_rule.value.destination_port_ranges
      #source_address_prefix      = security_rule.value.source_address_prefix
      #destination_address_prefix = security_rule.value.destination_address_prefix
      #source_address_prefixes 	 = security_rule.value.source_address_prefixes
      #destination_address_prefixes = security_rule.value.destination_address_prefixes
      #source_address_prefix      = can(index(security_rule.value, "source_address_prefix`")) ? security_rule.value.source_address_prefix : null
      #destination_address_prefix = can(index(security_rule.value, "destination_address_prefix")) ? security_rule.value.destination_address_prefix : null
      #source_address_prefixes    = can(index(security_rule.value, "source_address_prefix")) ? null : security_rule.value.source_address_prefixes
      #destination_address_prefixes = can(index(security_rule.value, "destination_address_prefix")) ? null : security_rule.value.destination_address_prefixes
      source_address_prefix   	= try(security_rule.value.source_address_prefix, null)
      destination_address_prefix = try(security_rule.value.destination_address_prefix, null)
      source_address_prefixes   = try(security_rule.value.source_address_prefixes, null)
      destination_address_prefixes = try(security_rule.value.destination_address_prefixes, null)
    }
  }

  tags = {
    Environment = "Production"
  }

}
data "azurerm_network_security_group" "example_data" {
    name                = azurerm_network_security_group.example.name
    resource_group_name = azurerm_network_security_group.example.resource_group_name
}


