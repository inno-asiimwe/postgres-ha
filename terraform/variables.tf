variable "master_ip" {
    type = "string"
    default = "10.142.0.7/20"

}

variable "slave_1_ip" {
    type = "string"
    default = "10.142.0.8/20"
}

variable "slave_2_ip" {
    type = "string"
    default = "10.142.0.9/20"
}

variable "etcd_ip" {
    type = "string"
    default = "10.142.0.10/20"
}

variable "haproxy_ip" {
    type = "string"
    default = "10.142.0.11/20"
}

variable "haproxy_external_ip" {
    type = "string"
    default = "34.73.100.217"
}