provider "aws" {
  region = "ap-south-1"
  version = "~> 2.63"
}

 
/*
module "paytmpbio_dns" {
  source               = "git::ssh://git@bitbucket.org/paytmteam/terraform-public_route53.git?ref=v1.2.0"
  environment          = "prod"
  profile              = "saas"
  domain               = "paytmpb.io"
  a_subdomain_list     = ["wazuhmastercontroller"]
  cname_subdomain_list = ["wazuhcontroller"]


  a_subdomain_map = {
    "wazuhmastercontroller" = "172.23.129.185"
  }
  
  cname_subdomain_map = {
    "wazuhcontroller" = "internal-wazuhtest-1403146398.ap-south-1.elb.amazonaws.com"
  }

}

output paytmpbio_public_route53_id {
  value = "${module.paytmpbio_dns.public_route53_id}"
}
*/

module "paytm_bank_dns" {
  source               = "./route53"
  domain               = "paytm.com"
  organization         = "paytmbank"
  a_subdomain_list     = []
  cname_subdomain_list = $name_subdomain_list

  a_subdomain_map = {
  }

  cname_subdomain_map = {
   
    "$cname_subdomain_list[i]" = "$cname_subdomain_map[i]",
  }
}
