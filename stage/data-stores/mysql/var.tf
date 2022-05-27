variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default = "dynamo_lock_table_data_stores"
}

variable "db_password" {
  description = "the password for db"
}
