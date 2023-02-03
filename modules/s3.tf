resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_folder" "folder" {
  count = length(var.folder_names)

  bucket = aws_s3_bucket.bucket.id
  folder_name = var.folder_names[count.index]
}

