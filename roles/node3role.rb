name 'node3role'
description 'Role for node 3, which is running as Secondary/Arbiter for MongoDB Replicaset'
run_list(
  'sc-mongodb::replicaset'
)
override_attributes(
  'mongodb' => {
    'cluster_name' => "<name-of-cluster>",
    'auto_configure' => {
      'replicaset' => "false"
    },
    'config' => {
      'mongod' => {
        'replication' => {
          'replSetName' => "<name-of-cluster>"
        }
      }
    }
  }
)