module "prod-vpc" {
  source = "./modules/vpc"
  vpcName = "main"
}

module "static-ip" {
  source = "./modules/staticIp"
  name = "website-ip"
}

module "website" {
  source = "./modules/computeInstance"
  region = var.region
  zone = var.zone
  computeInstanceName = "website"
  tags = [ "web", "website", "ssh" ]
  networkInterface = {
    network = module.prod-vpc.vpcName
    subnet = module.prod-vpc.subnetNames[0]  
  }
  natIp = module.static-ip.ipv4
  metadata = {
    foo = "bar"
    ssh-keys = "admin:${file("/Users/berk/.ssh/safaws.pub")}"
  }
  startupScript = <<SCRIPT
echo test1 > /terraformStartup.txt
echo test2 > /terraformStartup.txt
    SCRIPT
}