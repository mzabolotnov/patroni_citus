resource "yandex_kubernetes_cluster" "cluster" {
  name                    = "postgres-patroni"
  description             = "k8s-patroni"
  folder_id               = var.folder_id
  network_id              = var.network_id
  service_account_id      = var.service_account_id
  node_service_account_id = var.node_service_account_id
  release_channel         = "RAPID"
  


  master {
    version   = "1.25"
    public_ip = true
    zonal {
      zone                     = var.zone
      subnet_id                = var.subnet_id
  
        }

    }
}


resource "yandex_kubernetes_node_group" "default-pool" {
  
  cluster_id  = yandex_kubernetes_cluster.cluster.id
  name        = "default-pool"
  description = "default-pool"
  version     = "1.25"
  
  instance_template {
    
    platform_id = "standard-v2"
    # nat         = true
    metadata    = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
    
  }
  

    resources {
      cores         = 4
      core_fraction = 50
      memory        = 16
    }
    network_interface {
      nat =  true
      subnet_ids = [var.subnet_id]
        }
    boot_disk {
      
      size = 50
      
    }
    
}
  scale_policy  {
    fixed_scale {
      size = 3
    }
      }
   
   
}




