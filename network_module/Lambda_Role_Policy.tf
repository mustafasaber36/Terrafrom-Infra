resource "aws_iam_policy" "iam_policy_for_lambda" {
 name         = "policy_to_access_ses_by_lambda"
 path         = "/"
 description  = "policy_to_access_ses_by_lambda"
 policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Effect":"Allow",
      "Action":[
        "ses:SendEmail",
        "ses:SendRawEmail"
      ],
      "Resource":"*"
    }
  ]
}
EOF
}
#defining the role for lambda function
resource "aws_iam_role" "lambda_role" {
name   = "Sending_Emails_Lambda_Function_Role"
assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}
#attaching the role with its policy
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.iam_policy_for_lambda.arn

}

