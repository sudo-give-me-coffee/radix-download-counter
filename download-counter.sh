#!/bin/#!/usr/bin/env bash
sudo apt update;sudo apt install -y git python-requests wget
wget -q https://raw.githubusercontent.com/mmilidoni/github-downloads-count/master/gdc;chmod +x gdc
./gdc rauldipeas radix>downloads.log ; tac downloads.log | awk 'NR <=1' | sed 's/	Total Downloads for repo rauldipeas\/radix//g' | echo `xargs expr 4000 + ` Downloads > download-counter.log
git clone https://github.com/rauldipeas/radix-website;cd radix-website
cp ../download-counter.log website/download-counter/download-counter.log
git config --global user.email "rauldipeas@mail.com";git config --global user.name "Raul Dipeas"
git add .; git commit -m "Azure Pipeline Auto Build"
git push http://rauldipeas:$GITHUB_ACCESS_TOKEN@github.com/rauldipeas/radix-website.git HEAD:master
