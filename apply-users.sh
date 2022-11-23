#!/bin/sh
pushd ~/.dotfiles
nix build .#homeManagerConfigurations.mario.activationPackage
./result/activate
popd
