provider "aws" {
  region = "ap-south-1"
  version = "~> 2.63"
  profile = "default"
}
terraform {
  backend "s3" {
    bucket = "poc-route53"
    key    = "terraform_key.tfstate"
    region = "ap-south-1"
  }
}
module "paytm_bank_dns" {
  source               = "./route53"
  domain               = "zone_name"
  organization         = "paytmbank"
  a_subdomain_list     = a_domain_value_list
  cname_subdomain_list = cname_domain_value_list

  a_subdomain_map = { 
   a_record_map_value
   
   }

  cname_subdomain_map = {
    cname_map_value
  }
}
