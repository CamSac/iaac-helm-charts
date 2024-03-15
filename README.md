# iaac-helm-charts

## initialization of ArgoCD

appVersion=curl -s https://api.github.com/repos/argoproj/argo-cd/tags | jq -r '.[0].name'
kubectl apply -k "https://github.com/argoproj/argo-cd/manifests/crds?ref=<appVersion>"
helm upgrade --install argocd ./charts/argo-cd --create-namespace --namespace argocd
helm template charts/root-app -s templates/root-app.yaml | kubectl apply -f -
delete existing storageClass
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.4/cert-manager.crds.yaml
