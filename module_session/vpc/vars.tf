variable "cidr_block" {
    type = string
    description = "value of cidr"  
}

variable "cidr_block_s1" {
    type = string   
    description = "subnet cidr"
}

variable "az" {
    type = string
    description = "az for s1"  
}

variable "cidr_block_s2" {
    type = string   
    description = "subnet cidr 2"
}

variable "az2" {
    type = string   
    description = "az for subnet 2"  
}

variable "cidr_rt" {
    type = string
    description = "cidr for route table"
  
}