provider "acme" {
  server_url = var.acme_api_endpoint
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.acme_registration_email
}


resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
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