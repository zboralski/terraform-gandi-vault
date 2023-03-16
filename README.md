# Gandi with Vault and Terraform

`terraform-gandi-vault` lets you manage Gandi DNS records using the Gandi API key stored in Vault.

## Prerequisites

1. Terraform installed
2. Vault server up and running

## Vault Setup

### Check the KV secrets engine version

```bash
vault secrets list -detailed
[...]
```

```bash
vault secrets enable -path=secret kv-v2
Success! Enabled the kv-v2 secrets engine at: secret/
```

If the KV version is version:1, upgrade it to version:2.

```bash
vault kv enable-versioning secret/
```

### Write secrets

Store your Gandi API key in Vault:

```bash
echo -n API_KEY | vault kv put -mount=secret vendor/gandi/username api_key=-
```

### Retrieve the key

To retrieve the stored Gandi API key:

```bash
vault kv get secret/vendor/gandi/username
```

## Usage

1. Clone this repository
2. Update the example configuration in main.tf with the appropriate values (domain, record name, etc.)
3. Run terraform init to initialize the Terraform working directory
4. Run terraform apply to apply the desired changes

```hcl
module "gandi_vault_tf" {
  source = "github.com/belua/gandi-vault-test" 

  api_key_path = "secret/vendor/gandi/username"
  domain       = "example.com"
  name         = "test"
  type         = "A"
  ttl          = 300
  values       = ["192.168.1.1"]
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
