variable "dynamo_table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default = "webserver_state_lock_stage"
}

variable "state_bucket_name" {
  description = "s3 bucket for webservers state file"
  default = "terraform-webservers-stage"
}

variable "state_file_key" {
  description = "state file key name in s3"
  default = "terraform.tfstate"
}

variable "cluster_name" {
  description = "ec2 cluster name"
  default = "webserver-cluster-stage"
}

variable "db_remote_bucket_name" {
  description = "s3 bucket name that stores db state file"
  default = "terraform-data-stores-stage"
}
