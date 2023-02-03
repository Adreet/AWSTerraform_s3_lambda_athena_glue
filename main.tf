provider "aws" {
  region = "us-west-2"
}

module "s3" {
  source = "./modules/s3"

  bucket_name = "my-bucket"
  folder_names = ["folder1", "folder2", "folder3", "folder4"]
}

module "lambda" {
  source = "./modules/lambda"

  function_names = ["lambda1", "lambda2"]
}

module "glue" {
  source = "./modules/glue"

  job_name = "my-glue-job"
  database_name = "my-glue-catalog"
}

module "athena" {
  source = "./modules/athena"

  workgroup_name = "my-athena-workgroup"
}

module "iam_roles" {
  source = "./modules/iam"
  roles = [
    {
      role_name = "s3_access_role",
      policy = "${file("policies/s3_access_policy.json")}"
    },
    {
      role_name = "lambda_execution_role",
      policy = "${file("policies/lambda_execution_policy.json")}"
    },
    {
      role_name = "glue_role",
      policy = "${file("policies/glue_policy.json")}"
    },
    {
      role_name = "athena_role",
      policy = "${file("policies/athena_policy.json")}"
    }
  ]
}


