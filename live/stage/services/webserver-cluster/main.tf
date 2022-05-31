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
  source = "../../../../modules/services/webserver-cluster"

  cluster_name = "webserver-cluster-stage"
  db_remote_state_bucket = "terraform-data-stores-stage"
  db_remote_state_key = "terraform.tfstate"

  instance_type = "t2.micro"
  min_size = 2
  max_size = 2
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type = "ingress"
  security_group_id = "${module.webserver_cluster_stage.security_group_id}"
  from_port = 12345
  to_port = 12345
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
