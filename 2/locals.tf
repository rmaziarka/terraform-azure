locals {
    resource_group_name  = "terraform-example"
    first_network_name   = "${local.resource_group_name}-first"
    second_network_name  = "${local.resource_group_name}-second"
    storage_account_name = "${replace(local.resource_group_name, "-", "")}sa"
}