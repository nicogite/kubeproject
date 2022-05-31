#!/bin/bash

sudo apt-get update && sudo apt-get install -y curl virtualbox

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

minikube start --memory 8192