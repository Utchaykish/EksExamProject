output "pub_subnet"{
  description = "ID of the public subnet"
  value       = module.Networks.public_subnets
}

output "priv_subnet"{
  description = "ID of the private subnet"
  value       = module.Networks.private_subnets

}

output "endpoint" {
  value = module.eks_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = module.eks_cluster.kubeconfig-certificate-authority-data
}

output "id" {
  value = module.eks_cluster.id
}

output "pub_subnet_1" {
  description = "ID of the public subnet"
  value       = module.Networks.pub_subnet_1
}

output "pub_subnet_2" {
  description = "ID of the public subnet"
  value       = module.Networks.pub_subnet_2
}