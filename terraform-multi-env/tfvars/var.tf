variable "common_tags" {
    type = map
    default = {

    Project = "expense"
    Terraform = true
    }
}

variable "tags" {
    type = map
}

variable "ingress_1" {

}

variable "instances" {

}

variable "zone_id" {
  default = "Z017838439GYM2G1E1QUJ"
}
variable "domain_name" {
  default = "expensemind.online"
}

variable "sg_name" {
    

}

