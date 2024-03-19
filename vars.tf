variable "projectName" {
  default = "backend-fast-food"
}
 
variable "clusterName" {
  default = "BackendFastFood"
}

variable "subnet" {
  default = "subnet-052bc7647ee2fadf0"
}
 
variable "vpcId" {
  default = "vpc-0b8dd4f56f9ebc85f"
}

variable "region" {
  default = "${ secrets.AWS_REGION }"
}

variable "AWSAccount" {
  default = "${ secrets.AWS_ACCESS_KEY_ID }"
}
