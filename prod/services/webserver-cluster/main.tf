provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "terraform-webservers-prod"
    dynamodb_table = "webserver_state_lock_prod"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
  }
}

module "webserver_cluster_prod" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "${var.cluster_name}"
  db_remote_state_bucket = "${var.db_remote_bucket_name}"
  db_remote_state_key = "${var.state_file_key}"
}
