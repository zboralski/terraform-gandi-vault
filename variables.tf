variable "api_key_path" {
  description = "The path to the Gandi API key in Vault"
  type        = string
  default     = "secret/vendor/gandi"
}

variable "api_key_field" {
  description = "Field name of the Gandi API key stored in Vault"
  type        = string
  default     = "api_key"
}

variable "domain" {
  type        = string
  description = "The domain name to update the DNS record for"
}

variable "name" {
  type        = string
  description = "The name of the DNS record to update"
}

variable "type" {
  type        = string
  description = "The type of the DNS record to update"
}

variable "ttl" {
  description = "The TTL for the updated DNS record"
  default     = 300
}

variable "values" {
  description = "The values for the updated DNS record"
  type        = list(string)
}
