terraform {
  backend "s3" {
    bucket = "Bucket-${var.projectName}"
    key    = "k8s"
    region = "${var.region}"
  }
}

provider "aws" {
  region = "${var.region}"
}
