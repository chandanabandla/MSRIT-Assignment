variable "namespace" {
  type        = "string"
  default     = "MSRIT"
  description = "organization name"
}

variable "stage" {
  type        = "string"
  default     = "Test"
  description = "Stage name"
}

variable "name" {
  type        = "string"
  default     = "eks"
  description = "cluster name"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter"
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "Used for Additional attributes"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags"
}

variable "enabled" {
  type        = "string"
  description = "Whether to create the resources or not"
  default     = "true"
}

variable "allowed_security_groups_cluster" {
  type        = "list"
  default     = []
  description = "List of Security Group IDs to be allowed to connect to the EKS cluster"
}

variable "allowed_security_groups_workers" {
  type        = "list"
  default     = []
  description = "List of Security Group IDs to be allowed to connect to the worker nodes"
}

variable "allowed_cidr_blocks_cluster" {
  type        = "list"
  default     = []
  description = "List of CIDR blocks to be allowed to connect to the EKS cluster"
}

variable "allowed_cidr_blocks_workers" {
  type        = "list"
  default     = []
  description = "List of CIDR blocks to be allowed to connect to the worker nodes"
}

variable "region" {
  type        = "string"
  default     = "ap-south-1"
  description = "AWS Region"
}

variable "vpc_cidr_block" {
  type        = "string"
  default     = "172.30.0.0/16"
  description = "VPC CIDR block"
}

variable "image_id" {
  type        = "string"
  default     = ""
  description = "EC2 image ID to launch"
}

variable "eks_worker_ami_name_filter" {
  type        = "string"
  description = "AMI name filter to lookup the most recent EKS AMI if `image_id` is not provided"
  default     = "amazon-eks-node-v*"
}

variable "instance_type" {
  type        = "string"
  default     = "t2.medium"
  description = "Instance type to launch"
}

variable "health_check_type" {
  type        = "string"
  description = "Controls how health checking is done"
  default     = "EC2"
}

variable "max_size" {
  default     = 3
  description = "The maximum size of the AutoScaling Group"
}

variable "min_size" {
  default     = 2
  description = "The minimum size of the AutoScaling Group"
}

variable "wait_for_capacity_timeout" {
  type        = "string"
  description = "A maximum duration that Terraform should wait for instances to be healthy before timing out"
  default     = "10m"
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the worker nodes in the VPC"
  default     = true
}

variable "autoscaling_policies_enabled" {
  type        = "string"
  default     = "true"
  description = "Whether to create `aws_autoscaling_policy` and `aws_cloudwatch_metric_alarm` resources to control Auto Scaling"
}

variable "cpu_utilization_high_threshold_percent" {
  type        = "string"
  default     = "80"
  description = "Worker nodes AutoScaling Group CPU utilization high threshold percent"
}

variable "cpu_utilization_low_threshold_percent" {
  type        = "string"
  default     = "20"
  description = "Worker nodes AutoScaling Group CPU utilization low threshold percent"
}

variable "availability_zones" {
  type        = "list"
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c", "ap-south-1d"]
  description = "Availability Zones for the cluster"
}

variable "apply_config_map_aws_auth" {
  type        = "string"
  default     = "false"
  description = "Whether to allow the worker nodes to join the EKS cluster"
}
