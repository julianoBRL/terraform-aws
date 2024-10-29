

# Obtém a identidade da conta atual
data "aws_caller_identity" "current" {}

######################################
#
# DEADLETTER QUEUE
#
######################################
data "aws_iam_policy_document" "sqs_terraform_demo_dl_queue_policy_document" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ListDeadLetterSourceQueues",
      "sqs:ReceiveMessage",
      "sqs:SendMessage"
    ]
    resources = [aws_sqs_queue.sqs_terraform_demo_dl_queue.arn]
    principals {
      type = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
  }
}




######################################
#
# DEMO QUEUE
#
######################################
data "aws_iam_policy_document" "sqs_terraform_demo_queue_policy_document" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ListDeadLetterSourceQueues",
      "sqs:ReceiveMessage",
      "sqs:SendMessage"
    ]
    resources = [aws_sqs_queue.sqs_terraform_demo_queue.arn]
    principals {
      type = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
  }
}

