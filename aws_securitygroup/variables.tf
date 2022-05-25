variable "allowed_ports" {
  default = {
      "80" = ["0.0.0.0/0"],
      "443" = ["127.0.0.1/32"]
  }
}

variable "vpc_id" {
  default = ""
}