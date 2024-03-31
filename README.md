# iaac-helm-charts

## initialization of ArgoCD

```sh
curl -s https://api.github.com/repos/argoproj/argo-cd/tags | jq -r '.[0].name'

helm template charts/root-app -s templates/root-app.yaml | kubectl apply -f -

kubectl delete <default-storage-class>

kubectl apply -k "https://github.com/argoproj/argo-cd/manifests/crds?ref=<appVersion>"

helm upgrade --install argocd ./charts/argocd --create-namespace --namespace argocd

curl -s https://api.github.com/repos/cert-manager/cert-manager/tags | jq -r '.[0].name'

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/<appVersion>/cert-manager.crds.yaml

```

## To Do

- create a dependency helm chart to create deployments, services, and volume mounts

- get fixed ip address from router and setup DDNS

- investigate non root user on kavita and filebrowser(or alternatives)

- overwrite rancher default storage class

- bitwarden and use passwords for this

- setup argo cd

- create an even better helm repo based on lazy-helm-charts

- maybe learn kustomize since it will handles crds for me

### CRDs that need managing

- argocd

- traefik

- cert-manager

- metallb

- k3s version

- keep an eye on traefik experimental plugin
