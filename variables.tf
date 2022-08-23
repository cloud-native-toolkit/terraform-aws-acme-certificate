variable "acme_registration_email" {
  type        = string
  description = "Email address used to register with letsencrypt"
}

variable "domain" {
  type        = string
  description = "Domain for this certificate e.g. apps.cluster.example.com"
}

variable "aws_access_key" {
  description = "AWS account access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS account secret key"
  type        = string
}

// Following variables have default values

variable "acme_api_endpoint" {
  description = "ACME API endpoint, defaults to letsencrypt prod directory."
  type        = string
  default     = "https://acme-v02.api.letsencrypt.org/directory"
}

variable "staging_api_endpoint" {
  description = "Staging Acme API endpoint (used for testing)"
  type        = string 
  default     = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

variable "testing" {
  description = "Flag to be set if testing and to use staging certificates (default = false)"
  type        = bool
  default     = false
}

variable "wildcard_domain" {
  type        = bool
  description = "Specify wether wildcard subdomain should be supported e.g. *.apps.cluster.example.com"
  default     = false
}
