# main.tf

# Configure the Gandi provider using the API key from Vault
provider "gandi" {
  key = data.vault_generic_secret.gandi_api_key.data["api_key"]
}

# Retrieve the Gandi API key from the specified Vault path
data "vault_generic_secret" "gandi_api_key" {
  path = var.api_key_path
}

# Retrieve the domain information from Gandi
data "gandi_domain" "domain" {
  name = var.domain
}

# Create or update the specified DNS record
resource "gandi_livedns_record" "dns_record" {
  zone   = data.gandi_domain.domain.id
  name   = var.name
  type   = var.type
  ttl    = var.ttl
  values = var.values
}