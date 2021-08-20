inputs = {
  environment    = "develop"
}
include {
  path = find_in_parent_folders()
}
terraform {
  source = "../../../infrastructure-modules/frontend-app"
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()
    optional_var_files = [
      find_in_parent_folders("sensitive.tfvars")
    ]
  }
}
