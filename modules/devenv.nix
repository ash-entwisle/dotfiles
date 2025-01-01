{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rustup
    cargo
    llvm
    llvmPackages.bintools
    glibc.dev

    jdk
    jdk8
  ];



}
