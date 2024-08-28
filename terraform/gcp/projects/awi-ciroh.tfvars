prefix                 = "awi-ciroh"
project_id             = "devops-424119"
zone                   = "us-central1-b"
region                 = "us-central1"
core_node_machine_type = "n2-highmem-4"
enable_network_policy  = true
enable_logging         = false

filestores = {
  "filestore" = { capacity_gb = 70 }
}

# Cloud costs for this project are not passed through by 2i2c
budget_alert_enabled = false
billing_account_id   = ""

k8s_versions = {
  min_master_version : "1.29.4-gke.1043002",
  core_nodes_version : "1.29.4-gke.1043002",
  notebook_nodes_version : "1.29.4-gke.1043002",
  dask_nodes_version : "1.29.4-gke.1043002",
}

user_buckets = {
  "scratch-dev" : {
    "delete_after" : 7,
    "uniform_bucket_level_access_only" : true
  },
  "persistent-dev" : {
    "delete_after" : null,
    "uniform_bucket_level_access_only" : true
  }
}

# Setup notebook node pools
notebook_nodes = {
  "n2-standard-2" : {
    min : 0,
    max : 1,
    machine_type : "n2-standard-2",
  },
  "n2-highmem-2" : {
    min : 0,
    max : 1,
    machine_type : "n2-highmem-2",
  },
}

# Setup a single node pool for dask workers.
#
# A not yet fully established policy is being developed about using a single
# node pool, see https://github.com/2i2c-org/infrastructure/issues/2687.
#
dask_nodes = {
  "n2-highmem-2" : {
    min : 0,
    max : 1,
    machine_type : "n2-highmem-2"
  },
}

# FIXME: Uncomment requester pays lines and add bucket names to admin access
#        once bucket access policy restriction has been lifted from the project
hub_cloud_permissions = {
  "dev" : {
    bucket_admin_access : ["scratch-dev", "persistent-dev"],
    hub_namespace : "dev"
  },
}

container_repos = []
