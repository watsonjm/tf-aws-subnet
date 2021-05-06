variable "vpc_id" {
  type        = string
  default     = ""
  description = "VPC ID"
}
variable "name" {
  type        = string
  default     = ""
  description = "Name of the subnet"
}
variable "cidr" {
  type        = list(string)
  default     = []
  description = "Subnet in CIDR format"
}
variable "az_ids" {
  type        = list(string)
  default     = []
  description = "List of Availability Zone IDs"
}
variable "rt_id" {
  type        = string
  default     = ""
  description = "Route Table ID"
}
variable "tags" {
  type        = map(any)
  description = "map of tags"
}
