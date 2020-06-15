variable "businessunit" {
  description = "the name of your business unit to create"
  default     = "banktech"
}

variable "organization" {
  default = "paytm-finserv"
}

variable "domain" {
  default = "paytmpb.io"
}

variable "cname_subdomain_list" {
  type = list
  default = []
}

variable "cname_subdomain_map" {
  type = map
  default = {}

}


variable "a_subdomain_list" {
  type = list
  default = []

}

variable "a_subdomain_map" {
  type = map
  default = {}


}



