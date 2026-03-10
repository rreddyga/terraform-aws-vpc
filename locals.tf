locals {
  common_tags = {
    Project     = var.project
    Environment = var.env
    Terraform   = "true"
  }

  vpc_final_tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.env}"
    },
    var.vpc_tags
  )
}
