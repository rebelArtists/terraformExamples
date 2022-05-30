variable "dynamo_table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default = "data_stores_state_lock_prod"
}

variable "state_bucket_name" {
  description = "s3 bucket name that stores db state file"
  default = "terraform-data-stores-prod"
}

variable "state_file_key" {
  description = "state file key name in s3"
  default = "terraform.tfstate"
}

variable "db_password" {
  description = "rds db password"
  default = "testing123"
}

variable "mysql_db_name" {
  description = "rds db name"
  default = "mysql_data_store_prod"
}
