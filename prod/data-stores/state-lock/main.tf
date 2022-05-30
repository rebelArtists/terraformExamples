provider "aws" {
  region = "us-east-1"
}

module "state-lock-services-prod" {
  source = "../../../modules/global/state-lock"

  dynamo_table_name = "${var.dynamo_table_name}"
  state_bucket_name = "${var.state_bucket_name}"
  state_file_key = "${var.state_file_key}"
}
