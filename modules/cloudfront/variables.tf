variable "origin_id" {
  type        = string
  default     = ""
  description = "Origin ID"
}

variable "bucket_domain_name" {
  type        = string
  default     = ""
  description = "Bucket domain name"
}

variable "cdn_price_class" {
  type        = string
  default     = "PriceClass_200"
  description = "CDN price class"
}

variable "cdn_tags" {
  type        = map(string)
  default     = {}
  description = "CDN tags"
}
