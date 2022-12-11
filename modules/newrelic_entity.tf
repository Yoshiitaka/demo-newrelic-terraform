data "newrelic_entity" "app_name" {
  name = "test"
  type = "Host"
}

resource "newrelic_alert_policy" "alert_policy_name" {
  name = "My Alert Policy Name"
}

# NRQL alert condition
resource "newrelic_nrql_alert_condition" "foo" {
  policy_id                    = newrelic_alert_policy.alert_policy_name.id
  type                         = "static"
  name                         = "foo"
  description                  = "Alert when transactions are taking too long"
  runbook_url                  = "https://www.example.com"
  enabled                      = true
  violation_time_limit_seconds = 3600

  nrql {
    query             = "SELECT average(duration) FROM Transaction where appName = '${data.newrelic_entity.app_name.name}'"
    evaluation_offset = 3
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
}