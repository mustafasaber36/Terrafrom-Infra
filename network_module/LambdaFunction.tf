#defining the lambda function
resource "aws_lambda_function" "Sending_mails_fn" {
filename          = "python.zip"
function_name     = "Sending_Emails_Lambda_Function"
role              = aws_iam_role.lambda_role.arn
handler           = "index.lambda_handler"
runtime           = "python3.8"
depends_on        = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}
#==============Permission============================
resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.Sending_mails_fn.arn
  principal     = "s3.amazonaws.com"
  source_arn    = data.aws_s3_bucket.objects.arn
}
#=================Bucketpart=========================
data "aws_s3_bucket" "objects" {
  bucket = "thesourceonemoustafa"
}
#==================Bucket_Notifications===============
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = data.aws_s3_bucket.objects.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.Sending_mails_fn.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "AWSLogs/"
    filter_suffix       = ".log"
  }

  depends_on = [aws_lambda_permission.allow_bucket]
}