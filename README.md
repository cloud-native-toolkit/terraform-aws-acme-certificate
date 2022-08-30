# AWS ACME Certificate

## Module Overview

Module that creates a TLS certificate for AWS using the Automated Certificate Management Environment (ACME), including the following resources:
- tls_private_key
- acme_registration
- acme_certificate

**Note:** This module follows the Terraform conventions regarding how provider configuration is defined within the Terraform template and passed into the module - https://www.terraform.io/docs/language/modules/develop/providers.html. The default provider configuration flows through to the module. If different configuration is required for a module, it can be explicitly passed in the `providers` block of the module - https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly.

### Prerequisites

The requested domain name must be configured in Route 53 and accessable by the AWS access credentials.

### Software dependencies

This module has no dependencies on software components.

### Command line tools

- terraform >= 1.2.6

### Terraform providers

- ACME provider `vancluever/acme` >= 2.8.0

### Module dependencies

This module does not make use of other modules.

## Example Usage

```hcl-terraform
module "acme-cert-apps" {
    source = "github.com/cloud-native-toolkit/terraform-aws-acme-certificate"

    domain                  = "apps.mycluster.clusters.mydomain.com"
    wildcard_domain         = true
    acme_registration_email = "me@here.com"
    aws_access_key          = var.access_key
    aws_secret_key          = var.secret_key
    testing                 = true
}
```


## Variables

### Inputs

This module has the following input variables:
| Variable | Mandatory / Optional | Default Value | Description |
| -------------------------------- | --------------| ------------------ | ----------------------------------------------------------------------------- |
| domain | Mandatory | "" | The FQDN to associate the certificate with  |
| wildcard_domain | Optional | false | Specifies whether the domain requires wildcard support (e.g. *.apps.cluster.example.com)
| acme_registration_email | Mandatory | "" | A valid email address to register the certificate with |
| aws_access_key | Mandatory | "" | AWS access key to validate the DNS |
| aws_secret_key | Mandatory | "" | AWS secret key to validate the DNS |
| testing | Optional | false | Flag to set which of the API endpoints to be used to generate the certificate. Set true to use the staging endpoint. Refer to https://letsencrypt.org/docs/staging-environment/ for details on certificate quotas of each endpoint |
| create_certificate | Optional | true | Flag to create a certificate or not. Used with BYO certificate workflows. |
| acme_api_endpoint | Optional | "https://acme-v02.api.letsencrypt.org/directory" | ACME production API Endpoint |
| staging_api_endpoint | Optional | "https://acme-staging-v02.api.letsencrypt.org/directory" | ACME staging API Endpoint |

### Outputs

This module outputs the following values:
| Value | Description |
| -------------------------------- | ----------------------------------------------------------------------------- |
| cert | The created certificate |
| key | The private key for the certificate (sensitive) |
| issuer_ca | Certificate authority bundle for the certificate |