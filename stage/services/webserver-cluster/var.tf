variable "server_port" {
  description = "port for HTTP requests"
  default = 8080
}

variable "elb_port" {
  description = "port for ELB requests"
  default = 80
}

variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default = "dynamo_lock_table_services"
}
