
provider "aws" {
  region = "sa-east-1"
}

######################################
#
# DEADLETTER QUEUE
#
######################################
resource "aws_sqs_queue" "sqs_terraform_demo_queue_dl" {
  name                          = var.sqs_terraform_demo_queue_dl_name
  message_retention_seconds     = 86400
  fifo_queue                    = true
  content_based_deduplication   = true
  deduplication_scope           = var.sqs_terraform_demo_queue_dl_deduplication_scope
  fifo_throughput_limit         = "perMessageGroupId"
}

resource "aws_sqs_queue_policy" "sqs_terraform_demo_queue_dl_policy" {
  queue_url = aws_sqs_queue.sqs_terraform_demo_queue_dl.id
  policy = data.aws_iam_policy_document.sqs_terraform_demo_queue_dl_policy_document.json
}





######################################
#
# DEMO QUEUE
#
######################################
resource "aws_sqs_queue" "sqs_terraform_demo_queue" {
  name                          = var.sqs_terraform_demo_queue_name
  message_retention_seconds     = 16400
  fifo_queue                    = true
  content_based_deduplication   = true
  deduplication_scope           = var.sqs_terraform_demo_queue_deduplication_scope
  fifo_throughput_limit         = "perMessageGroupId"
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_terraform_demo_queue_dl.arn
    maxReceiveCount     = 4
  })
}

resource "aws_sqs_queue_policy" "sqs_terraform_demo_queue_policy" {
  queue_url = aws_sqs_queue.sqs_terraform_demo_queue.id
  policy = data.aws_iam_policy_document.sqs_terraform_demo_queue_policy_document.json
}

