terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "3.9.0"
    }
  }
  required_version = "1.1.6"
}

provider "newrelic" {
  account_id = "12345678"
  api_key = "NRAK-testtesttets"
  region = "US"
}
