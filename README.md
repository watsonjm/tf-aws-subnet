### What is this?
This is an opinionated AWS subnets module I use.
### Example 
```
subnets = {
  public = {
    cidr    = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
    rt      = "public"
    name    = "public-subnet"
    auto_ip = true
  }
  private = {
    cidr    = ["10.0.8.0/21", "10.0.16.0/21", "10.0.24.0/21"]
    rt      = "private"
    name    = "private-subnet"
    auto_ip = null
  }
  eks_private = {
    cidr    = ["10.0.240.0/21", "10.0.248.0/21"]
    rt      = "private"
    name    = "eks-private-subnet"
    auto_ip = null
  }
}

locals {
    route_table = {
    public     = try(aws_route_table.public_default.id, "This route table does not exist.")
    private    = try(aws_route_table.private_default.id, "This route table does not exist.")
  }
}

data "aws_availability_zones" "all" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


module "subnets" {
  for_each                = var.subnets
  source                  = "./module/subnets/"
  name                    = "${local.name_tag}-${each.value.name}"
  vpc_id                  = module.vpc.vpc_id
  cidr                    = each.value.cidr
  az_ids                  = data.aws_availability_zones.all.zone_ids
  rt_id                   = lookup(local.route_table, each.value.rt, try(aws_route_table.private_default.id, null))
  map_public_ip_on_launch = each.value.auto_ip
}
```
