variable "computeInstanceName" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "computeInstanceType" {
  type = string
  default = "e2-medium"
}

variable "tags" {
  type = list(string)
  default = [ ]
}

variable "bootDisk" {
  type = object({
    image = string
    size = number
    labels = map(string)
  })
  default = {
    image = "debian-cloud/debian-11"
    size = 10
    labels = {}
  }
}

variable "networkInterface" {
  type = object({
    network = string
    subnet = string
  })
  default = {
    network = "default"
    subnet = ""
  }
}

variable "natIp" {
  type = string
  default = null
}

variable "metadata" {
  type = map(string)
  default = {}
}

variable "startupScript" {
  type = string
  default = ""
}