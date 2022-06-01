# Kubernetes

## Installation 

Installation de kubernetes Dashboard en local via le script installation-minikube.sh

Installation de kubectl :
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

Activer l'auto-complétion pour les commandes kubectl

```
apt install bash-completion
echo "source <(kubectl completion bash)" >> ~/.bashrc
```

## Lancement du dashboard Minikube

minikube dashboard

## Help

Chaque commande kctl fournit une aide détaillée sur elle-même : 
kubectl config -h

## Création d'un user, d'un cluster et d'un contexte avec kubectl

```
kubectl config set-cluster cluster-formation --embed-certs --server=https://$(minikube ip):8443 --certificate-authority=$HOME/.minikube/ca.crt

kubectl config set-credentials nico --client-certificate=$HOME/.minikube/ca.crt --client-key=$HOME/.minikube/ca.key

kubectl config set-context formation --user=nico --cluster=cluster-formation
```

## Création d'un pod

```
kubectl run nginx --image=nginx:latest --port=8000 --labels="env=dev"
```

Si il y a un pb avec le port 8080, relancer minikube avec :
```
minikube start
```

## Deployment

- Génère des replicaSets

## ReplicaSets

- Créé des Pods et maintient leur nombre
- Se base sur un template de pod pour créer les nouveaux pods

## DaemonSets

- Lance un pod sur chaque node
- Est généralement utilisé pour lancer un daemon (application système) sur chaque node

## Services

- Permet d'exposer les pods à l'extérieur (par exemple via une redirection de port)


## Ingress

- Définit des routes pour accéder aux services, et donc aux pods













