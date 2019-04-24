terragrunt = {
  include {
    path = "${find_in_parent_folders()}"
  }
  terraform {
    source = "git::ssh://git@github.com/monosolutions/terraform-modules.git//mono-tileserver"
  }
}
region = "eu-central-1"
environment = "prod"
instance_type = "t2.large"
mono_vpc_remote_state = "prod/vpc/terraform.tfstate"
mono_alb_remote_state = "prod/tileserver-alb/terraform.tfstate"
mono_keypair_remote_state = "prod/mono-keypair/terraform.tfstate"
mono_efs_remote_state = "prod/mono-efs/terraform.tfstate"
mono_region = "fra"
version = "2.0"
state_bucket = "tg-state-eu-central-1"
