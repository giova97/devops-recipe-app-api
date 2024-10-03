#########################################################################################
# CreateIAM user and policies for Continuos Deploy CD account #
#########################################################################################

resource "aws_iam_user" "cd" {
  name = "recipe-app-api-cd"
}

resource "aws_iam_access_key" "cd" {
  user = aws_iam_user.cd.name
}

#########################################################################################
# policy for Terraform backend to S3 and DynamoDB access #
#########################################################################################

data "aws_iam_policy_document" "backend" {
  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${var.tf_state_bucket}"]


  }
  statement {
    effect  = "Allow"
    actions = ["s3:GetObject", "s3:PutObject", "deleteObject"]
    resources = ["arn:aws:s3:::${var.tf_state_bucket}/tf-state-deploy/*",
    "arn:aws:s3:::${var.tf_state_bucket}/tf-state-deploy-env/*"]

  }
  statement {
    effect    = "Allow"
    actions   = ["dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:DeleteItem", "dynamodb:DescribeTable"]
    resources = ["arn:aws:dynamodb:*:*:table/${var.tf_state_lock_table}"]
  }
}

resource "aws_iam_policy" "tf_backend" {
  name   = "${aws_iam_user.cd.name}-tf-s3-dynamodb"
  policy = data.aws_iam_policy_document.backend.json
}

resource "aws_iam_user_policy_attachment" "tf_backend" {
  user       = aws_iam_user.cd.name
  policy_arn = aws_iam_policy.tf_backend.arn
}
