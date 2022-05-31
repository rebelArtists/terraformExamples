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
  source = "../../../../modules/services/webserver-cluster"

  cluster_name = "webserver-cluster-prod"
  db_remote_state_bucket = "terraform-data-stores-prod"
  db_remote_state_key = "terraform.tfstate"

  instance_type = "t2.micro"
  min_size = 2
  max_size = 10
}

resource "aws_autoscaling_schedule" "scale_out_morning" {
  scheduled_action_name = "scale-out-morning"
  min_size = 2
  max_size = 10
  desired_capacity = 10
  recurrence = "0 9 * * *"

  autoscaling_group_name = "${module.webserver_cluster_prod.asg_name}"
}

resource "aws_autoscaling_schedule" "scale_in_night" {
  scheduled_action_name = "scale-in-night"
  min_size = 2
  max_size = 10
  desired_capacity = 2
  recurrence = "0 17 * * *"

  autoscaling_group_name = "${module.webserver_cluster_prod.asg_name}"
}
