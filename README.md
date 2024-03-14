# iaac-helm-charts

## initialization of ArgoCD

helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade --install argocd argo/argo-cd -f ./argocd/values.yaml --create-namespace --namespace argocd
