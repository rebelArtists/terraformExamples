provider "aws" {
  region = "us-east-1"
}

module "state-lock-services-prod" {
  source = "../../../modules/global/state-lock"

  dynamo_table_name = "data_stores_state_lock_prod"
  state_bucket_name = "terraform-data-stores-prod"
  state_file_key = "terraform.tfstate"
}
