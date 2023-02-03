# main.tf
resource "aws_athena_workgroup" "this" {
  name = var.workgroup_name
}

# variables.tf
variable "workgroup_name" {
  type = string
}

# outputs.tf
output "athena_workgroup_name" {
  value = aws_athena_workgroup.this.name
}

