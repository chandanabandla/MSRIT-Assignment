variable "namespace" {
  type        = "string"
  default     = "MSRIT"
  description = "Namespace"
}

variable "stage" {
  type        = "string"
  default     = "test"
  description = "Stage"
}

variable "environment" {
  type        = "string"
  default     = "Test"
  description = "Environment"
}

variable "name" {
  type        = "string"
  default     = "test"
  description = "Cluster name"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used"
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "Additional attributes"
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

variable "region" {
  type        = "string"
  default     = "Ap-south-2"
  description = "AWS Region"
}

variable "cluster_name" {
  type        = "string"
  description = "The name of the EKS cluster"
}

variable "cluster_endpoint" {
  type        = "string"
  description = "EKS cluster endpoint"
}

variable "cluster_certificate_authority_data" {
  type        = "string"
  description = "certificate data required to communicate with the cluster"
}

variable "cluster_security_group_id" {
  type        = "string"
  description = "Security Group ID of the EKS cluster"
}

variable "instance_initiated_shutdown_behavior" {
  type        = "string"
  description = "Shutdown behavior for the instances"
  default     = "terminate"
}

variable "image_id" {
  type        = "string"
  description = "EC2 image ID to launch"
  default     = ""
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

variable "key_name" {
  type        = "string"
  description = "The SSH key name that should be used for the instance"
  default     = ""
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with an instance in a VPC"
  default     = false
}

variable "enable_monitoring" {
  description = "Enable/disable detailed monitoring"
  default     = true
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "block_device_mappings" {
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI"
  type        = "list"
  default     = []
}

variable "instance_market_options" {
  description = "The market option for the instances"
  type        = "list"
  default     = []
}

variable "placement" {
  description = "The placement specifications of the instances"
  type        = "list"
  default     = []
}

variable "credit_specification" {
  description = "Customize the credit specification of the instances"
  type        = "list"
  default     = []
}

variable "elastic_gpu_specifications" {
  description = "Specifications of Elastic GPU to attach to the instances"
  type        = "list"
  default     = []
}

variable "disable_api_termination" {
  description = "If `true`, enables EC2 Instance Termination Protection"
  default     = false
}

variable "max_size" {
  default     = 3
  description = "The maximum size of the autoscale group"
}

variable "min_size" {
  default     = 1
  description = "The minimum size of the autoscale group"
}

variable "default_cooldown" {
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start"
  default     = 300
}

variable "health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health"
  default     = 300
}

variable "health_check_type" {
  type        = "string"
  description = "Controls how health checking is done. Valid values are `EC2` or `ELB`"
  default     = "EC2"
}

variable "force_delete" {
  description = "Allows deleting the autoscaling group without waiting for all instances in the pool to terminate"
  default     = false
}

variable "load_balancers" {
  type        = "list"
  description = "A list of elastic load balancer names to add to the autoscaling group names"
  default     = []
}

variable "target_group_arns" {
  type        = "list"
  description = "A list of aws_alb_target_group ARNs, for use with Application Load Balancing"
  default     = []
}

variable "termination_policies" {
  description = "A list of policies to decide how the instances in the auto scale group should be terminated"
  type        = "list"
  default     = ["Default"]
}

variable "suspended_processes" {
  type        = "list"
  description = "A list of processes to suspend for the AutoScaling Group"
  default     = []
}

variable "placement_group" {
  type        = "string"
  description = "The name of the placement group into which to launch the instances"
  default     = ""
}

variable "metrics_granularity" {
  type        = "string"
  description = "The granularity to associate with the metrics to collect"
  default     = "1Minute"
}

variable "enabled_metrics" {
  description = "A list of metrics to collect"
  type        = "list"

  default = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

variable "wait_for_capacity_timeout" {
  type        = "string"
  description = "A maximum duration that Terraform should wait for ASG instances to be healthy before timing out"
  default     = "10m"
}

variable "min_elb_capacity" {
  description = "Setting this causes Terraform to wait for this number of instances to show up healthy in the ELB only on creation"
  default     = 0
}

variable "wait_for_elb_capacity" {
  description = "Setting this will cause Terraform to wait for exactly this number of healthy instances in all attached load balancers"
  default     = false
}

variable "protect_from_scale_in" {
  description = "Allows setting instance protection"
  default     = false
}

variable "service_linked_role_arn" {
  type        = "string"
  description = "The ARN of the service-linked role that the ASG will use to call other AWS services"
  default     = ""
}

variable "autoscaling_policies_enabled" {
  type        = "string"
  default     = "true"
  description = "Whether to create `aws_autoscaling_policy` and `aws_cloudwatch_metric_alarm` resources to control Auto Scaling"
}

variable "scale_up_cooldown_seconds" {
  type        = "string"
  default     = "300"
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start"
}

variable "scale_up_scaling_adjustment" {
  default     = 1
  description = "The number of instances by which to scale"
}

variable "scale_up_adjustment_type" {
  type        = "string"
  default     = "ChangeInCapacity"
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity"
}

variable "scale_up_policy_type" {
  type        = "string"
  default     = "SimpleScaling"
  description = "The scalling policy type"
}

variable "scale_down_cooldown_seconds" {
  type        = "string"
  default     = "300"
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start"
}

variable "scale_down_scaling_adjustment" {
  default     = -1
  description = "The number of instances by which to scale"
}

variable "scale_down_adjustment_type" {
  type        = "string"
  default     = "ChangeInCapacity"
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity"
}

variable "scale_down_policy_type" {
  type        = "string"
  default     = "SimpleScaling"
  description = "The scalling policy type"
}

variable "cpu_utilization_high_evaluation_periods" {
  type        = "string"
  default     = "2"
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "cpu_utilization_high_period_seconds" {
  type        = "string"
  default     = "300"
  description = "The period in seconds over which the specified statistic is applied"
}

variable "cpu_utilization_high_threshold_percent" {
  type        = "string"
  default     = "90"
  description = "The value against which the specified statistic is compared"
}

variable "cpu_utilization_high_statistic" {
  type        = "string"
  default     = "Average"
  description = "The statistic to apply to the alarm's associated metric"

variable "cpu_utilization_low_evaluation_periods" {
  type        = "string"
  default     = "2"
  description = "The number of periods over which data is compared to the specified threshold"
}

variable "cpu_utilization_low_period_seconds" {
  type        = "string"
  default     = "300"
  description = "The period in seconds over which the specified statistic is applied"
}

variable "cpu_utilization_low_threshold_percent" {
  type        = "string"
  default     = "10"
  description = "The value against which the specified statistic is compared"
}

variable "cpu_utilization_low_statistic" {
  type        = "string"
  default     = "Average"
  description = "The statistic to apply to the alarm's associated metric"
}
