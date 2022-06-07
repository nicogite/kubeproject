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

## Minikube

Minikube permet d'utiliser Kubernetes en local. Il faut le démarrer pour pouvoir ensuite lancer des commandes kubectl.
Toutes ces commandes s'exécuteront dans le contexte "minikube"

### Lancement de minikube

```
minikube start
```

### Lancement du dashboard Minikube

```
minikube dashboard
```

Le dashboard permet de suivre les entités créées au sein du contexte minikube


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

En général, on créé les pods grâce à des "déploiements", ce qui permet de relancer automatiquement les pods qui s'éteignent.

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
- Permet aux pods de cummuniquer entre eux

On vérifie les services actifs avec :
```
kubectl get services
```

On peut obtenir l'url d'un service avec :
```
minikube service <service-name> --url
```


## Ingress

- Définit des routes pour accéder aux services, et donc aux pods
- NOTE : Il faut activer le module dans minikube pour pouvoir l'utiliser :
```
minikube addons enable ingress
```

## Jobs

- Permet de lancer une commande dans un pod dédié à cette tâche
- Le pod sera détruit une fois la tâche effectuée

## CronJobs

- Lance un job de façon cyclique

## Détruire un Objet

```
kubectl delete -f <filename>
```

## Récupérer des informations sur un pod

```
kubectl describe pod <nom_du_pod>
```

## Health Check

On peut vérifier régulièrement l'état d'un pod en ajoutant liveness et/ou readyness à ses spec
- liveness exécute un test périodiquement pendant la durée de vie du pod. Si le test échoue, le pod est redémarrer
- readiness exécute un test périodiquement au lancement du pod. Permet d'indiquer que le pod est prêt.

## Persistent Volumes

- Permet la persistence des données
- Partage les données entre les pods
- Ils sont "préparés" en amont par les admins
- Ils sont "demandés" à l'instanciation par les développers
- On peut avoir des volumes en local, mais surtout dans le Cloud (AWS, Azure, GCP...)

## Volume - Empty dir

- Volume créé lorsqu'un pod est assigné à un noeud
- Tous les conteneurs de ce pods peuvent lire et écrire dedans.
- Ses données sont supprimées lorsque le Pod est supprimé

On vérifie que les volumes ont bien été demandés avec :
```
kubectl get pvc
```

## Stratégies de déploiement


La stratégie de déploiement est définie... dans les specs du déploiement

- RollingUpdate : Met à jour petit à petit les replicas du set
- Recreate : Remplace tout les replicas par les nouveaux (utile si on ne veut pas que les users aient une expérience dégradée pendant le déploiement, ou si les replicas ne peuvent que fonctionner tous ensemble)
- Canary : Ne déploie les nouveaux replicas que sur une petite partie du set (1/4 en général). Utile pour faire des tests sur une partie des users.

## Passer la certification

### Livre fondamental sur Kubernetes :
https://github.com/kelseyhightower/kubernetes-the-hard-way

### Tips pour passer l’examen :
https://www.componentsoft.io/blog/the-kubernetes-cka-exam-11-tips-for-better-chances/

### Exercices certifications :
- https://github.com/stretchcloud/cka-lab-practice
- https://github.com/dgkanatsios/CKAD-exercises
- https://github.com/alijahnas/CKA-practice-exercises




















