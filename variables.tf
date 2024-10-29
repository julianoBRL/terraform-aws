
variable "sqs_terraform_demo_queue_name" {
  description = "Nome da fila SQS"
  type = string
  default = "sqs_terraform_demo_queue"
}

variable "sqs_terraform_demo_queue_deduplication_scope" {
  description = "Como ele vai fazer a deduplicação queue/messageGroup"
  type = string
  default = "messageGroup"
}




variable "sqs_terraform_demo_queue_dl_name" {
  description = "Nome da fila SQS"
  type = string
  default = "sqs_terraform_demo_queue_dl"
}

variable "sqs_terraform_demo_queue_dl_deduplication_scope" {
  description = "Como ele vai fazer a deduplicação queue/messageGroup"
  type = string
  default = "messageGroup"
}