resource "aws_security_group" "db" {
  name        = ${var.project_name}-${var.Environment}-db
  description = var.sg_description
  vpc_id = var.vpc_id

  dynamic "egress" {
    for_each = var.outbound_rule
    content {
        from_port        = egress.value["from_port"]
        to_port          = egress.value["to_port"]
        protocol         = egress.value["protocol"]
        cidr_blocks      = egress.value["cidr_blocks"]
    }

  dynamic "ingress" {
    for_each = var.ingress_rule
    content {
        from_port        = ingress.value["from_port"]
        to_port          = ingress.value["to_port"]
        protocol         = ingress.value["protocol"]
        cidr_blocks      = ingress.value["cidr_blocks"]
    }
}
}
  
  tags = merge(
    var.common_tags,
    var.sg_db_tags,
    {
        Name = ${var.project_name}-${var.Environment}-db
    }
  )
}