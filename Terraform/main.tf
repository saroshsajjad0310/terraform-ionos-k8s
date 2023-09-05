terraform {
  required_providers {
    ionoscloud = {
      source  = "ionos-cloud/ionoscloud"
      version = "~> 6.3.0"
    }
  }

}

provider "ionoscloud" {
  username = "Your_Username"
  password = "Your_Password"
}

resource "ionoscloud_datacenter" "ionos_task" {
  name                  = "Datacenter"
  location              = "de/fra"
  description           = "datacenter description"
  sec_auth_protection   = false
}


resource "ionoscloud_ipblock" "ionos_task" {
  location              = "de/fra"
  size                  = 4
  name                  = "IP Block IONOS Task"
}

resource "ionoscloud_k8s_cluster" "ionos_task" {
  name                  = "k8sClusterIONOSTask"
  k8s_version           = "1.27.4"
}

resource "ionoscloud_k8s_node_pool" "ionos_task" {
  datacenter_id         = ionoscloud_datacenter.ionos_task.id
  k8s_cluster_id        = ionoscloud_k8s_cluster.ionos_task.id
  name                  = "k8sNodePoolIONOSTask"
  k8s_version           = ionoscloud_k8s_cluster.ionos_task.k8s_version
  auto_scaling {
    min_node_count      = 1
    max_node_count      = 2
  }
  cpu_family            = "INTEL_SKYLAKE"
  availability_zone     = "AUTO"
  storage_type          = "SSD"
  node_count            = 2
  cores_count           = 2
  ram_size              = 2048
  storage_size          = 40
  public_ips            = [ ionoscloud_ipblock.ionos_task.ips[0], ionoscloud_ipblock.ionos_task.ips[1],ionoscloud_ipblock.ionos_task.ips[2],ionoscloud_ipblock.ionos_task.ips[3] ] 
}