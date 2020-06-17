resource "aws_route53_zone" "primary" {
  name = "paytm.com"
}
#  resource "aws_route53_record" "public_a_record" {
#    zone_id = "${aws_route53_zone.primary.id}"
#    name    = "${format("%s.%s", element(var.a_subdomain_list, count.index), var.domain)}"
#    type    = "A"
#    ttl     = "300"
#    records = [split(",", lookup(var.a_subdomain_map, element(var.a_subdomain_list, count.index)))]
#    count   = length(var.a_subdomain_list)
#  }

resource "aws_route53_record" "public_cname_record" {
  zone_id = aws_route53_zone.primary.id
  name    = "${format("%s.%s", element(var.cname_subdomain_list, count.index), var.domain)}"
  type    = "CNAME"
  ttl     = "5"
  records = ["${lookup(var.cname_subdomain_map, element(var.cname_subdomain_list, count.index))}"]
  count   = "${length(var.cname_subdomain_list)}"

}

