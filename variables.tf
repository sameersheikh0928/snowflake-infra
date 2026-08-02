variable "snowflake_account"     { type = string }
variable "snowflake_org"         { type = string }
variable "snowflake_user"        { type = string }
variable "snowflake_private_key" { type = string, sensitive = true }
variable "aws_region"            { type = string, default = "us-east-2" }