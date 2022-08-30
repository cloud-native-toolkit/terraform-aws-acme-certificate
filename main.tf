provider "acme" {
  server_url = var.testing ? var.staging_api_endpoint : var.acme_api_endpoint
}

resource "tls_private_key" "private_key" {
  count = var.create_certificate ? 1 : 0

  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  count = var.create_certificate ? 1 : 0

  account_key_pem = tls_private_key.private_key[0].private_key_pem
  email_address   = var.acme_registration_email
}


resource "acme_certificate" "certificate" {
  count = var.create_certificate ? 1 : 0

  account_key_pem           = acme_registration.reg[0].account_key_pem
  common_name               = var.domain
  subject_alternative_names = var.wildcard_domain ? ["*.${var.domain}"] : []

  dns_challenge {
    provider = "route53"

    config = {
        AWS_ACCESS_KEY_ID = "${var.aws_access_key}"
        AWS_SECRET_ACCESS_KEY = "${var.aws_secret_key}"
    }
  }
}