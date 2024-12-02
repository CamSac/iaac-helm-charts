# iaac-helm-charts

## initialization of ArgoCD

```sh
curl -s https://api.github.com/repos/argoproj/argo-cd/tags | jq -r '.[0].name'

helm template charts/root-app -s templates/root-app.yaml | kubectl apply -f -

kubectl delete <default-storage-class>

kubectl apply -k "https://github.com/argoproj/argo-cd/manifests/crds?ref=<appVersion>"

helm upgrade --install argocd ./charts/Infrastructure/argocd --create-namespace --namespace argocd

curl -s https://api.github.com/repos/cert-manager/cert-manager/tags | jq -r '.[0].name'

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/<appVersion>/cert-manager.crds.yaml

```

## To Do

- bitwarden and use passwords for this

- maybe learn kustomize since it will handles crds for me

- add resources limits and user restrictions on helm charts

### CRDs that need managing

- cert-manager

- metallb

- k3s version

  - sudo systemctl stop k3s

  - curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -s - --disable=traefik --disable=servicelb --write-kubeconfig-mode=644

###

| Application | user    | volume |
|-------------|---------|--------|
| cbz-backend | 1000    | yes    | (camer)
| crowdsec    | root    | yes    |
| kavita      | 1000    | yes    | (camer)
| postgresql  | 1001    | yes    |
| vaultwarden | 1002    | yes    |
| argoCD      | argocd  | no     |
| authentik   | 1000    | no     |
| certmanager | unknown | no     |
| metallb     | 100     | no     |
| Redis       | 1001    | no     |
| treafik     | 65532   | no     |
