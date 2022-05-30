variable "server_port" {
  description = "port for HTTP requests"
  default = 8080
}

variable "elb_port" {
  description = "port for ELB requests"
  default = 80
}

variable "cluster_name" {
  description = "name for cluster resources"
}

variable "db_remote_state_bucket" {
  description = "name of s3 bucket for db remote state"
}

variable "db_remote_state_key" {
  description = "s3 key for db remote state file"
}
