# outputs.terraform {

output "updated_dns_record" {
  value       = gandi_livedns_record.dns_record
  description = "The updated Gandi DNS record"
}