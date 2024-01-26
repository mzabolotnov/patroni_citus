variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable service_account_id {}

variable node_service_account_id {}

variable subnet_id {}

variable network_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  default     = "ru-central1-a"
}
variable public_key_path {
  default = "~/.ssh/appuser.pub"
}

variable service_account_key_file {
  description = "key .json"
}
# variable private_key {
#   description = "private_key"
# }


