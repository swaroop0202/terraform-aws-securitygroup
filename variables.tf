variable "project_name"{
    type = string
}

variable "Environment"{
    type = string
}




variable "sg_description"{
    type = string
}

variable "outbound_rule"{
    type = list
    default = [
        {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}

variable "ingress_rule"{
    type = list
    default = [
        {}
    ]
}

variable "common_tags"{
    type = map
    default = {
        project = "expense"
        Terraform = "true"
        Environment = "dev"
        Module = "db"
    }
}

variable "sg_db_tags"{
    type = map
    default = {} #optional
}

variable "vpc_id"{
    type = string
}