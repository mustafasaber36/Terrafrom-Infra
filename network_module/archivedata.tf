data "archive_file" "init" {
  type        = "zip"
  source_file = "${path.module}/python.py"
  output_path = "${path.module}/python.zip"
}
