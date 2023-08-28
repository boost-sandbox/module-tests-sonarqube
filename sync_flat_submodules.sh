#!/bin/bash

repos=(
  "juice-shop git@github.com:juice-shop/juice-shop.git v15.0.0"
  "dsvw git@github.com:stamparm/DSVW.git master"
  "capital git@github.com:Checkmarx/capital.git main"
  "brokencrystals git@github.com:NeuraLegion/brokencrystals master"
)

for repo in "${repos[@]}"; do
  read -r name url version <<<"$repo"
  
  rm -rf "$name"
  git clone "$url" "$name"
  git -C "$name" checkout "$version"
  rm -rf "$name/.git"
done
