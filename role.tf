resource "aws_iam_role" "config_role" {
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  name               = "ConfigRole"
}


resource "aws_iam_role_policy_attachment" "config" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
  role       = aws_iam_role.config_role.name
}

resource "aws_iam_role_policy" "config" {
  name   = "config-bucket-access"
  policy = data.aws_iam_policy_document.role_policy.json
  role   = aws_iam_role.config_role.id
}