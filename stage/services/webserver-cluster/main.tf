provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "terraform-webservers-stage"
    dynamodb_table = "webserver_state_lock_stage"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
  }
}

module "webserver_cluster_stage" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "${var.cluster_name}"
  db_remote_state_bucket = "${var.db_remote_bucket_name}"
  db_remote_state_key = "${var.state_file_key}"
}
