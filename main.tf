module "s3" {
  source      = "./modules/s3"
  name_prefix = "${var.tags.project}-${var.tags.env}-${var.tags.region}"
  tags = merge(var.tags,
    {
      module = "s3"
    }
  )
}
