terraform {
  cloud {
    organization = "SAMEER_snowflake"

    workspaces {
      name = "snowflake-prod"
    }
  }

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.9"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "snowflake" {
  organization_name = var.snowflake_org
  account_name      = var.snowflake_account
  user              = var.snowflake_user
  private_key       = var.snowflake_private_key
  role              = "TERRAFORM_ROLE"
}

provider "aws" {
  region = var.aws_region
}

resource "snowflake_database" "this" {
  name = "SNOWFLAKE_APP_DB"
}

resource "snowflake_schema" "this" {
  database = snowflake_database.this.name
  name     = "SNOWFLAKE_APP_SCHEMA"
}

resource "snowflake_warehouse" "this" {
  name           = "SNOWFLAKE_APP_WH"
  warehouse_size = "XSMALL"
  auto_suspend   = 30
  auto_resume    = true
}