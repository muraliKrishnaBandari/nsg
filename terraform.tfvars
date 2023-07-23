security_rules = [
  {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_ranges          = "*"
    destination_port_ranges     = "22"
    destination_address_prefixes = ["200.160.200.30","200.160.200.60"]
    source_address_prefixes      = ["10.0.0.0/24","192.168.1.0/24","172.16.0.0/16"]
  },
  {
    name                       = "AllowHTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_ranges          = "*"
    destination_port_ranges     = "80"
    source_address_prefixes      = ["200.160.200.30"]
    destination_address_prefixes = ["10.0.0.0/24","192.168.1.0/24","172.16.0.0/16"]
  },
  {
    name                       = "AllowUDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_ranges          = "*"
    destination_port_ranges     = "123"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    #source_address_prefixes      = ["200.160.200.30"]
    #destination_address_prefixes = ["10.0.0.0/24","192.168.1.0/24","172.16.0.0/16"]
  },
  {
    name                       = "AllowDNS"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_ranges          = "*"
    destination_port_ranges     = "53"
    source_address_prefixes      = ["200.160.200.30"]
    destination_address_prefixes= ["10.0.0.0/24","192.168.1.0/24","172.16.0.0/16"]
  },
]

