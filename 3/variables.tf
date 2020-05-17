variable "first_network_address_space" {
  description = "first network address space"
  type        = list(string)
}


variable "second_network_address_space" {
  description = "second network address space"
  type        = list(string)
  default     = ["10.1.0.0/16"]
}