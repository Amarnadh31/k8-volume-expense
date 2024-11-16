variable "project" {
    default = "expense"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Terraform = true
        Environment = "dev"
    }
  
}

variable "docker_tags" {
    default = {
        component = "docker"
    }
  
}