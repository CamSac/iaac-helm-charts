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

- bitwarden and use passwords for this

- create an even better helm repo based on lazy-helm-charts

- maybe learn kustomize since it will handles crds for me

- add resources limits and user restrictions on helm charts

- argocd dex and authentik

### CRDs that need managing

- argocd

- traefik

- cert-manager

- metallb

- k3s version

- keep an eye on traefik experimental plugin

###

| Application | user    | volume |
|-------------|---------|--------|
| crowdsec    | root    | yes    |
| kavita      | root    | yes    |
| postgresql  | 1001    | yes    |
| suwayomi    | 1003    | yes    |
| vaultwarden | 1003    | yes    |
| argoCD      | argocd  | no     |
| authentik   | 1000    | no     |
| certmanager | unknown | no     |
| metallb     | 100     | no     |
| Redis       | 1001    | no     |
| treafik     | 65532   | no     |
