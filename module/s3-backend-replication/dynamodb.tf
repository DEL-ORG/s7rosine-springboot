#resource "aws_dynamodb_table" "tf_state_lock" {
# provider = aws.origin
# name         = format("%s-%s-%s-tf-state", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"])
# billing_mode = "PAY_PER_REQUEST"
# hash_key     = "LockID"

# attribute {
#   name = "LockID"
#   type = "S"
# }

# tags = var.common_tags
#}
