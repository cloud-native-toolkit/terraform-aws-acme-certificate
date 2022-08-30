
output "cert" {
  value = var.create_certificate ? acme_certificate.certificate[0].certificate_pem : ""
}

output "key" {
  sensitive = true
  value     = var.create_certificate ? acme_certificate.certificate[0].private_key_pem : ""
}

output "issuer_ca" {
  value = var.create_certificate ? acme_certificate.certificate[0].issuer_pem : ""
}