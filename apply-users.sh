#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/mario/home.nix
popd
