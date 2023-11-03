resource "shoreline_notebook" "rabbitmq_policy_violation_incident" {
  name       = "rabbitmq_policy_violation_incident"
  data       = file("${path.module}/data/rabbitmq_policy_violation_incident.json")
  depends_on = [shoreline_action.invoke_update_rabbitmq_policy]
}

resource "shoreline_file" "update_rabbitmq_policy" {
  name             = "update_rabbitmq_policy"
  input_file       = "${path.module}/data/update_rabbitmq_policy.sh"
  md5              = filemd5("${path.module}/data/update_rabbitmq_policy.sh")
  description      = "Review the existing policies and update them if necessary to prevent future policy violations. This may involve revising the access control rules, message queue limits, and message expiration times."
  destination_path = "/tmp/update_rabbitmq_policy.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_update_rabbitmq_policy" {
  name        = "invoke_update_rabbitmq_policy"
  description = "Review the existing policies and update them if necessary to prevent future policy violations. This may involve revising the access control rules, message queue limits, and message expiration times."
  command     = "`chmod +x /tmp/update_rabbitmq_policy.sh && /tmp/update_rabbitmq_policy.sh`"
  params      = ["NEW_POLICY_DEFINITION","POLICY_NAME","VIRTUAL_HOST"]
  file_deps   = ["update_rabbitmq_policy"]
  enabled     = true
  depends_on  = [shoreline_file.update_rabbitmq_policy]
}

