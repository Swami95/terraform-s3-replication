provider "aws" {
  region  = var.aws_region_primary
  profile = "devops-cloud"  # Change to your AWS profile
}

provider "aws" {
  alias   = "west"
  region  = var.aws_region_secondary
  profile = "devops-cloud"  # Change if needed
}
