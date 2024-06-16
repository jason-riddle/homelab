# TF VARS: https://app.terraform.io/app/org-jasonriddle/workspaces/cloud-infrastructure/variables

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    # DOCS: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    # ENVS: AWS_REGION, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
    # CRED: https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/users/details/terraform-cloud-infrastructure-system-user?section=permissions
    # NAME: terraform-cloud-infrastructure-system-user
    # PERM: AdministratorAccess
    # aws = {
    #   source = "hashicorp/aws"
    # }

    cloudflare = {
      source = "cloudflare/cloudflare"
    }

    # DOCS: https://registry.terraform.io/providers/integrations/github/latest/docs
    # ENVS: GITHUB_TOKEN
    # CRED: https://github.com/settings/tokens
    # NAME: terraform-cloud-infrastructure-system-user
    # PERM: ''
    github = {
      source = "integrations/github"
    }

    # DOCS: https://registry.terraform.io/providers/tailscale/tailscale/latest/docs
    # ENVS: TAILSCALE_OAUTH_CLIENT_ID, TAILSCALE_OAUTH_CLIENT_SECRET
    # CRED: https://login.tailscale.com/admin/settings/oauth
    # NAME: terraform-cloud-infrastructure
    # PERM: scopes:all
    tailscale = {
      source = "tailscale/tailscale"
    }

    # DOCS: https://registry.terraform.io/providers/hashicorp/tfe/latest/docs
    # ENVS: TFE_TOKEN
    # CRED: https://app.terraform.io/app/settings/tokens
    # NAME: terraform-cloud-infrastructure-system-user
    # PERM: ''
    tfe = {
      source = "hashicorp/tfe"
    }
  }
}

# provider "aws" {
#   default_tags {
#     tags = {
#       ManagedBy = "Terraform"
#       Project   = "https://github.com/jason-riddle/cloud-infrastructure"
#     }
#   }
# }

provider "cloudflare" {}
