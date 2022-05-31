provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "terraform-data-stores-prod"
    dynamodb_table = "data_stores_state_lock_prod"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
  }
}

module "datastore_cluster_prod" {
  source = "../../../../modules/data-stores/mysql"

  db_password = "testing123"
  mysql_db_name = "example_db_prod"
}
