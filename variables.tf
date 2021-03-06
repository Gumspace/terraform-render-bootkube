variable "cluster_name" {
  description = "Cluster name"
  type        = "string"
}

variable "api_servers" {
  description = "List of URLs used to reach kube-apiserver"
  type        = "list"
}

variable "etcd_servers" {
  description = "List of URLs used to reach etcd servers."
  type        = "list"
}

variable "asset_dir" {
  description = "Path to a directory where generated assets should be placed (contains secrets)"
  type        = "string"
}

variable "cloud_provider" {
  description = "The provider for cloud services (empty string for no provider)"
  type        = "string"
  default     = ""
}

variable "networking" {
  description = "Choice of networking provider (flannel or calico)"
  type        = "string"
  default     = "flannel"
}

variable "network_mtu" {
  description = "CNI interface MTU (applies to calico only)"
  type        = "string"
  default     = "1500"
}

variable "network_ip_autodetection_method" {
  description = "Method to autodetect the host IPv4 address (applies to calico only)"
  type        = "string"
  default     = "first-found"
}

variable "pod_cidr" {
  description = "CIDR IP range to assign Kubernetes pods"
  type        = "string"
  default     = "10.2.0.0/16"
}

variable "service_cidr" {
  description = <<EOD
CIDR IP range to assign Kubernetes services.
The 1st IP will be reserved for kube_apiserver, the 10th IP will be reserved for kube-dns.
EOD

  type    = "string"
  default = "10.3.0.0/24"
}

variable "cluster_domain_suffix" {
  description = "Queries for domains with the suffix will be answered by kube-dns"
  type        = "string"
  default     = "cluster.local"
}

variable "container_images" {
  description = "Container images to use"
  type        = "map"

  default = {
    calico           = "quay.io/calico/node:v3.1.3"
    calico_cni       = "quay.io/calico/cni:v3.1.3"
    flannel          = "quay.io/coreos/flannel:v0.10.0-amd64"
    flannel_cni      = "quay.io/coreos/flannel-cni:v0.3.0"
    hyperkube        = "k8s.gcr.io/hyperkube:v1.10.5"
    kubedns          = "k8s.gcr.io/k8s-dns-kube-dns-amd64:1.14.10"
    kubedns_dnsmasq  = "k8s.gcr.io/k8s-dns-dnsmasq-nanny-amd64:1.14.10"
    kubedns_sidecar  = "k8s.gcr.io/k8s-dns-sidecar-amd64:1.14.10"
    pod_checkpointer = "quay.io/coreos/pod-checkpointer:9dc83e1ab3bc36ca25c9f7c18ddef1b91d4a0558"
  }
}

variable "trusted_certs_dir" {
  description = "Path to the directory on cluster nodes where trust TLS certs are kept"
  type        = "string"
  default     = "/usr/share/ca-certificates"
}

variable "ca_certificate" {
  description = "Existing PEM-encoded CA certificate (generated if blank)"
  type        = "string"
  default     = ""
}

variable "ca_key_alg" {
  description = "Algorithm used to generate ca_key (required if ca_cert is specified)"
  type        = "string"
  default     = "RSA"
}

variable "ca_private_key" {
  description = "Existing Certificate Authority private key (required if ca_certificate is set)"
  type        = "string"
  default     = ""
}

# unofficial, temporary, may be removed without notice

variable "apiserver_port" {
  description = "kube-apiserver port"
  type        = "string"
  default     = "6443"
}

variable "apiserver_arguments" {
  description = "List of custom arguments to pass to apiserver"
  type        = "list"
  default     = []
}
