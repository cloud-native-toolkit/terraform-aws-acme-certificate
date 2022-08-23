
output "cert" {
  value = acme_certificate.certificate.certificate_pem
}

output "key" {
  sensitive = true
  value     = acme_certificate.certificate.private_key_pem
}

output "issuer_ca" {
  value = acme_certificate.certificate.issuer_pem
}