resource "google_container_cluster" "my-gk-cluster" {
  name = "my-gk-cluster"
  location = "asia-east1-a"
  initial_node_count = 1
  remove_default_node_pool = true
  network = google_compute_network.vpc-google-network.id
  subnetwork = google_compute_subnetwork.restricted-subnetwork.self_link

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes = true
    master_ipv4_cidr_block = "172.16.0.0/28"
    master_global_access_config {
      enabled = true
    }
  }

  network_policy {
    enabled = true
  }


  ip_allocation_policy {
  }





  master_authorized_networks_config {
    cidr_blocks {
      display_name = "manged-subnet"
      cidr_block = "10.0.0.0/24"
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write"
    ]
    service_account = google_service_account.instance-vm.email
  }

}

resource "google_container_node_pool" "gk-worker-nodes" {
    name = "gk-worker-nodes"
    cluster = google_container_cluster.my-gk-cluster.name
    location = "asia-east1-a"
    node_count = 1

    node_config {
      preemptible = true
      # tags = [ "private-rules" ]
      image_type = "COS_CONTAINERD"
      machine_type = "e2-medium"
      service_account = google_service_account.instance-vm.email
      oauth_scopes = [ 
        "https://www.googleapis.com/auth/compute",
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring.write"
       ]
    }
}