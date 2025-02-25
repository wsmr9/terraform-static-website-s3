variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "index_document" {
  description = "The name of the index document"
  type        = map(any)
  default = {
    suffix = "index.html"

  }
}

variable "error_document" {
  description = "The name of the error document"
  type        = map(any)
  default = {
    key = "error.html"
  }
}
