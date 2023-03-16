module "gandi_vault_tf" {
  source = "../" 

  api_key_path = "secret/vendor/gandi/username"
  domain       = "example.com"
  name         = "test"
  type         = "A"
  ttl          = 300
  values       = ["192.168.1.1"]
}