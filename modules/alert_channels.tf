# Notification channel
resource "newrelic_alert_channel" "alert_notification_email" {
  name = "username@example.com"
  type = "email"

  config {
    recipients              = "username@example.com"
    include_json_attachment = "1"
  }
}

# Link the above notification channel to your policy
resource "newrelic_alert_policy_channel" "alert_policy_email" {
  policy_id  = newrelic_alert_policy.alert_policy_name.id
  channel_ids = [
    newrelic_alert_channel.alert_notification_email.id
  ]
}