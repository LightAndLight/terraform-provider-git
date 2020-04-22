#! /usr/bin/env sh

mkdir -p ~/terraform.d/plugins
curl \
    -L \
    -o ~/terraform.d/plugins/terraform-provider-git-v0.0.1 \
    https://github.com/LightAndLight/terraform-provider-git/releases/download/v0.0.1/terraform-provider-git-v0.0.1
