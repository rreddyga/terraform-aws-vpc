locals {
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
    #devops-dev
    vpc_final_tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}"
        },
        var.vpc_tags
    )
    igw_final_tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}"
        },
        var.igw_tags
    )
    #we need to use slice function to get two az for our requirement by defualt 6 az are available
    # slice function(list,0,2)
                    # start_index is inclusive
                    $ end_index is exclusive that mean we will get index 0,1
    az_names = slice(data.aws_availability_zones.available.name,0,2)
}
