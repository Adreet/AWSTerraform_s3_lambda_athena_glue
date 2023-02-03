resource "aws_glue_job" "job" {
  name          = var.job_name
  command {
    name = "glueetl"
  }
}

resource "aws_glue_catalog_database" "database" {
  name = var.database_name
}

