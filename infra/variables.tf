# ============================================================
# infra/variables.tf
# eu-north-1 (Stockholm) — HTTP only (ingen domän/ACM/Route53)
# ============================================================

# ------------------------------------------------------------
# Variables from VPC module
# ------------------------------------------------------------
variable "vpc-cidr" {
  description = "Contains cidr block for vpc"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public-subnet1-cidr" {
  description = "Contains cidr block for public subnet1"
  type        = string
  default     = "10.0.0.0/27"
}

variable "az1" {
  description = "Contains AZ1"
  type        = string
  default     = "eu-north-1a" # ändrad från eu-west-2a
}

variable "public-subnet2-cidr" {
  description = "Contains cidr block for public subnet2"
  type        = string
  default     = "10.0.0.32/27"
}

variable "az2" {
  description = "Contains AZ2"
  type        = string
  default     = "eu-north-1b" # ändrad från eu-west-2b
}

variable "public-subnet3-cidr" {
  description = "Contains cidr block for public subnet3"
  type        = string
  default     = "10.0.0.64/27"
}

variable "az3" {
  description = "Contains AZ3"
  type        = string
  default     = "eu-north-1c" # ändrad från eu-west-2c
}

variable "private-subnet1-cidr" {
  description = "Contains cidr block for private subnet1"
  type        = string
  default     = "10.0.0.96/27"
}

variable "private-subnet2-cidr" {
  description = "Contains cidr block for private subnet2"
  type        = string
  default     = "10.0.0.128/27"
}

variable "private-subnet3-cidr" {
  description = "Contains cidr block for private subnet3"
  type        = string
  default     = "10.0.0.160/27"
}

variable "nat-gw-availability-mode" {
  description = "Contains NAT GWs availability mode"
  type        = string
  default     = "regional"
}

variable "nat-gw-connectivity-type" {
  description = "Contains NAT GWs connectivity type"
  type        = string
  default     = "public"
}

variable "internet-cidr" {
  description = "Contains internet's cidr block"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vpc-tags" {
  description = "Contains VPC's tag"
  type        = string
  default     = "vpc-gatus"
}

variable "public-subnet1-tags" {
  description = "Contains public subnet1's tag"
  type        = string
  default     = "public-subnet1"
}

variable "public-subnet2-tags" {
  description = "Contains public subnet2's tag"
  type        = string
  default     = "public-subnet2"
}

variable "public-subnet3-tags" {
  description = "Contains public subnet3's tag"
  type        = string
  default     = "public-subnet3"
}

variable "private-subnet1-tags" {
  description = "Contains private subnet1's tag"
  type        = string
  default     = "private-subnet1"
}

variable "private-subnet2-tags" {
  description = "Contains private subnet2's tag"
  type        = string
  default     = "private-subnet2"
}

variable "private-subnet3-tags" {
  description = "Contains private subnet3's tag"
  type        = string
  default     = "private-subnet3"
}

variable "igw-tags" {
  description = "Contains IGW's tag"
  type        = string
  default     = "igw-gatus"
}

variable "nat-gw-tags" {
  description = "Contains NAT GW's tag"
  type        = string
  default     = "nat-gw-gatus"
}

variable "public-rt-tags" {
  description = "Contains Public RT's tag"
  type        = string
  default     = "Public-RT"
}

variable "private-rt-tags" {
  description = "Contains Private RT's tag"
  type        = string
  default     = "Private-RT"
}

########################################################################

# ------------------------------------------------------------
# Variables from SG module
# ------------------------------------------------------------
variable "alb-sg-description" {
  description = "Contains ALB's SG description"
  type        = string
  default     = "SG for ALB"
}

variable "alb-sg-tags" {
  description = "Contains ALB's SG tag"
  type        = string
  default     = "alb-sg"
}

variable "alb-sg-inbound-HTTP-description" {
  description = "Contains ALB's SG's inbound description"
  type        = string
  default     = "Rule for inbound HTTP traffic to ALB"
}

variable "port-http" {
  description = "Contains port 80"
  type        = number
  default     = 80
}

variable "ip-protocol-tcp" {
  description = "Contains TCP as IP protocol"
  type        = string
  default     = "tcp"
}

# OBS: HTTPS-inbound-regeln (port 443) på ALB:s SG är borttagen i HTTP-only-varianten.
# Ta även bort aws_vpc_security_group_ingress_rule.alb-sg-HTTPS ur modules/sg/main.tf
# om den finns kvar, annars refererar den till variabler som inte längre finns.

variable "alb-sg-outbound-description" {
  description = "Contains ALB's SG outbound description"
  type        = string
  default     = "Rule for outbound traffic from ALB"
}

variable "ip-protocol-1" {
  description = "Contains -1 as ip protocol"
  type        = string
  default     = "-1"
}

variable "ecs-sg-description" {
  description = "Contains ECS's SG description"
  type        = string
  default     = "SG for ECS"
}

variable "ecs-sg-tags" {
  description = "Contains ECS's SG tag"
  type        = string
  default     = "ecs-sg"
}

variable "ecs-sg-inbound-description" {
  description = "Contains ECS's SG inbound description"
  type        = string
  default     = "Rule for inbound from ALB to ECS"
}

variable "port-app" {
  description = "Contains port 8080 (Gatus app-port)"
  type        = number
  default     = 8080
}

variable "ecs-sg-outbound-description" {
  description = "Contains ECS's SG outbound description"
  type        = string
  default     = "Rule for outbound from ECS"
}

########################################################################

# ------------------------------------------------------------
# Variables from ALB module (HTTP only)
# ------------------------------------------------------------
variable "alb-name" {
  description = "Contains ALB's name"
  type        = string
  default     = "alb-gatus"
}

variable "lb-type" {
  description = "Contains LB's type"
  type        = string
  default     = "application"
}

variable "alb-tags" {
  description = "Contains ALB's tag name"
  type        = string
  default     = "alb-gatus"
}

variable "tg-name" {
  description = "Contains TG's name"
  type        = string
  default     = "tg-for-ecs"
}

variable "tg-port" {
  description = "Contains TG's port"
  type        = number
  default     = 8080
}

variable "tg-protocol" {
  description = "Contains TG's protocol"
  type        = string
  default     = "HTTP"
}

variable "tg-ip-type" {
  description = "Contains TG's IP type"
  type        = string
  default     = "ipv4"
}

variable "tg-target-type" {
  description = "Contains TG's target type"
  type        = string
  default     = "ip"
}

variable "healthy-threshold" {
  description = "Contains health check's healthy threshold"
  type        = string
  default     = "3"
}

variable "health-check-interval" {
  description = "Contains health check's interval"
  type        = string
  default     = "30"
}

variable "health-check-protocol" {
  description = "Contains health check's protocol"
  type        = string
  default     = "HTTP"
}

variable "health-check-matcher" {
  description = "Contains health check's matcher"
  type        = string
  default     = "200-399"
}

variable "health-check-timeout" {
  description = "Contains health check's timeout"
  type        = string
  default     = "3"
}

variable "health-check-path" {
  description = "Contains health check's path"
  type        = string
  default     = "/health"
}

variable "health-check-unhealthy-threshold" {
  description = "Contains health check's unhealthy threshold"
  type        = string
  default     = "2"
}

variable "health-check-port" {
  description = "Contains health check's port"
  type        = string
  default     = "8080"
}

variable "listener-http-port" {
  description = "Contains ALB's HTTP listener port"
  type        = string
  default     = "80"
}

variable "listener-http-protocol" {
  description = "Contains ALB's HTTP listener protocol"
  type        = string
  default     = "HTTP"
}

# I HTTP-only-varianten forwardar HTTP-listenern direkt till target group
# istället för att redirecta till HTTPS. Därför är default "forward" (inte "redirect"),
# och alla redirect-/HTTPS-listener-variabler är borttagna.
variable "listener-http-action-type" {
  description = "Contains ALB's HTTP listener action type"
  type        = string
  default     = "forward"
}

variable "tg-attach-port" {
  description = "Contains TG's attach port"
  type        = number
  default     = 8080
}

########################################################################

# ------------------------------------------------------------
# Variables from ECR module
# ------------------------------------------------------------
variable "repository-name" {
  description = "Contains the repository name"
  type        = string
  default     = "gatus-ecs-project"
}

########################################################################

# ------------------------------------------------------------
# Variables from IAM module
# ------------------------------------------------------------
variable "iam-role-name" {
  description = "Contains the IAM role's name"
  type        = string
  default     = "ecsTaskExecutionRole"
}

variable "policy-arn" {
  description = "Contains Policy's arn"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

########################################################################

# ------------------------------------------------------------
# Variables from ECS module
# ------------------------------------------------------------
variable "cluster-name" {
  description = "Contains ECS's cluster name"
  type        = string
  default     = "gatus-ecs-cluster"
}

variable "setting-name" {
  description = "Contains setting name"
  type        = string
  default     = "containerInsights"
}

variable "setting-value" {
  description = "Contains setting value"
  type        = string
  default     = "enabled"
}

variable "cloudwatch-name" {
  description = "Contains cloudwatch group name"
  type        = string
  default     = "ecs-cloudwatch-logs"
}

variable "cloudwatch-retention-days" {
  description = "Contains Cloudwatch's retention days"
  type        = number
  default     = 365
}

variable "task-family" {
  description = "Contains task's family"
  type        = string
  default     = "ecs-gatus-task"
}

variable "network-mode" {
  description = "Contains task's network mode"
  type        = string
  default     = "awsvpc"
}

variable "requires-compatibilities" {
  description = "Contains task's required compatibilities"
  type        = string
  default     = "FARGATE"
}

variable "cpu-size" {
  description = "Contains CPU size"
  type        = number
  default     = 256
}

variable "memory-size" {
  description = "Contains memory size"
  type        = number
  default     = 512
}

variable "container-name" {
  description = "Contains container name"
  type        = string
  default     = "gatus-container"
}

variable "port-mapping-protocol" {
  description = "Contains the IP protocol for port mappings"
  type        = string
  default     = "tcp"
}

variable "log-config-driver" {
  description = "Contains the driver for logconfig"
  type        = string
  default     = "awslogs"
}

variable "aws-region" {
  description = "Contains the region"
  type        = string
  default     = "eu-north-1" # ändrad från eu-west-2
}

variable "aws-stream-prefix" {
  description = "Contains stream prefix"
  type        = string
  default     = "ecs"
}

variable "service-name" {
  description = "Contains the ecs service name"
  type        = string
  default     = "gatus-service"
}

variable "desired-count" {
  description = "Contains the desired count of tasks running"
  type        = number
  default     = 3
}

variable "launch-type" {
  description = "Contains the launch type for ecs service"
  type        = string
  default     = "FARGATE"
}

variable "platform-version" {
  description = "Contains the version of platform for Fargate"
  type        = string
  default     = "LATEST"
}

########################################################################