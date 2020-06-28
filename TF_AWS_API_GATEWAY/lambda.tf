# IAM role for lambda_action
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

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

  tags = {
    tag-key = "lambda"
  }
}

resource "aws_lambda_function" "bitcoin" {
  filename      = "TBD.zip"
  function_name = "bitcoinUSD"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "TBD-exports.test"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = "${filebase64sha256("TBD.zip")}"

  runtime = "ruby2.7"
}
