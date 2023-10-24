variable "vpcName" {
  type = string
}

variable "autoCreateSubnets" {
  type = bool
  default = false
}

variable "subnets" {
  type = list(object({
    cidr = string
    region = string  
  }))
  default = [
    {
      cidr = "10.10.0.0/24"
      region = "europe-west3"
    },
    {  
      cidr = "10.20.0.0/24"
      region = "europe-west1"
    }
  ]
}

variable "firewalls" {
    type = list(object({
    name = string
    ports = list(string) 
    protocol = string
    tags = list(string)
    sourceRanges = list(string)
  }))

  default = [
    {
      name = "http"
      ports = ["80", "443"]
      protocol = "tcp"
      tags = ["web"] 
      sourceRanges = [ "0.0.0.0/0" ]
    },
    {
      name = "ssh"
      ports = ["22"]
      protocol = "tcp"
      tags = ["ssh"]
      sourceRanges = [ "0.0.0.0/0" ]
    }
  ]
}