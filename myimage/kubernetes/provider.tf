provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "arn:aws:eks:us-east-1:853557926819:cluster/utchaykish-cluster"
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "myimage1-namespace"
  }
}