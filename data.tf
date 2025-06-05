data "terraform_remote_state" "network" {
  backend = "remote"
  config = {
    organization = "optimus_prime"
    workspaces = {
      name = "demo_optimus"
    }
  }
}
