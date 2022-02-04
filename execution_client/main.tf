terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {}

resource "digitalocean_droplet" "execution_client_1" {
  image     = "ubuntu-20-04-x64"
  name      = "rinkeby1-ec.baramio-nodes.com"
  region    = "nyc1"
  size      = "s-2vcpu-4gb"
  user_data = file("terramino_app.yaml")
}

resource "digitalocean_droplet" "execution_client_2" {
  image     = "ubuntu-20-04-x64"
  name      = "rinkeby2-ec.baramio-nodes.com"
  region    = "sfo3"
  size      = "s-2vcpu-4gb"
  user_data = file("ec_setup.yaml")
}