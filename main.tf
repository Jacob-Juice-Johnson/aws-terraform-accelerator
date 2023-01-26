module "s3" {
  source      = "./modules/s3"
  name_prefix = "${var.tags.project}-${var.tags.env}-${var.tags.region}"
  tags = merge(var.tags,
    {
      module = "s3"
    }
  )
}

# Module to test variable inject from POST call for a self service IaC TF workflow
module "s3_test_var_inject" {
  count       = var.test_var_inject == true ? 1 : 0
  source      = "./modules/s3"
  name_prefix = "${var.tags.project}-${var.tags.env}-${var.tags.region}-var-inject"
  tags = merge(var.tags,
    {
      module = "s3_test_var_inject"
    }
  )
}
