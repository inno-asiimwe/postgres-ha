# specify a provider, set up will be on the google compute engine.
provider "google" {
    project = "mentorship-1"
    region = "us-east1"
    zone = "us-east1-b"
    credentials: ${file("../account.json")}
}

// defining the master instance
resource "google_compute_instance" "postgres" {
    name = postgres-master
    machine_type = "n1-standard-1"
    zone = "us-east1-b"
    
    // Should use the postgres-master image while booting
    boot_disk {
        initialize_params {
            image = "postgres-master"
        }
    }

    // attach a static internal ip address
    network_interface {
        network = "default"
        network_ip = "${var.master_ip}"
    }
}

// defining the first slave instance
resource "google_compute_instance" "postgres" {
    name = "postgres-slave-1
    machine_type = "n1-standard-1"
    zone = "us-east1-b"

    // Should use the postgres-slave-1 image while booting
    boot_disk {
        initialize_params {
            image = "postgres-slave-1"
        }
    }

    // attach a static internal ip address
    network_interface {
        network = "default"
        network_ip = "${var.slave_1_ip}"
    }
}

// defining the second slave instance
resource "google_compute_instance" "postgres" {
    name = "postgres-slave-2"
    machine_type = "n1-standard-1"
    zone = "us-east1-b"

    // Should use the postgres-slave-2 image while booting
    boot_disk {
        initialize_params {
            image = "postgres-slave-2"
        }
    }

    // attach a static internal ip address
    network_interface {
        network = "default"
        network_ip = "${var.slave_2_ip}"
    }
}

// defining the etcd server instance
resource "google_compute_instance" "etcd" {
    name = "etcd-server"
    machine_type = "n1-standard-1"
    zone = "us-east1-b"

    // Should use the etcd-image
    boot_disk {
        initialize_params {
            image = "etcd-image"
        }
    }

    // attach a static internal ip address 
    network_interface {
        network = "default"
        network_ip = "${var.etcd_ip}"
    }
}

// defining the haproxy server instance
resource "google_compute_instance" "haproxy" {
    name = "ha-proxy-server"
    machine_type = "n1-standard-1"
    zone = "us-east1-b"

    // should use the ha-proxy-image
    boot_disk {
        initialize_params {
            image = "ha-proxy-image"
        }
    }

    // attach a static internal ip address
    network_interface {
        network = "default"
        network_ip = "${var.haproxy_ip}
        access_config {
            nat_ip: "${var.haproxy_external_ip}"
        }

    }

}

