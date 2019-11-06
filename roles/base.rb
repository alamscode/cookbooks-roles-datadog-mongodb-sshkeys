name 'base'
description 'base role, runs on every node'
run_list(
  'ntp',
  'datadog::dd-agent',
  'datadog::dd-handler'
)
default_attributes(
  'datadog' => {
    'api_key' => "2eb332752ea095516644ebf7a1793f17",
    'application_key' => "e80762de97111aa14fd705fb579bc17e4884f9e1"
  }
)
