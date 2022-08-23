module "dev_cluster" {
  source = "./module"

  domain                  = "api.rbe2.ocp-aws.ibm-software-everywhere.dev"
  wildcard_domain         = false
  acme_registration_email = "rich_ehrhardt@au1.ibm.com"
  aws_access_key          = var.access_key
  aws_secret_key          = var.secret_key
  testing                 = true
}
