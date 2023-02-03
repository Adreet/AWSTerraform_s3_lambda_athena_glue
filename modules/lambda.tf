resource "aws_lambda_function" "function" {
  count = length(var.function_names)

  function_name = var.function_names[count.index]
  filename      = "${var.function_names[count.index]}.zip"
  source_code_hash = 
filebase64sha256("${var.function_names[count.index]}.zip")
  handler       = "index.handler"
  runtime       = "python3.7"
  role          = aws_iam_role.lambda_execution_role.arn
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Effect = "Allow",
        Sid = ""
      }
    ]
  })
}

