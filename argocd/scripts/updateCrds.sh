appVersion=curl -s https://api.github.com/repos/argoproj/argo-cd/tags | jq -r '.[0].name'
kubectl apply -k "https://github.com/argoproj/argo-cd/manifests/crds?ref=<${appVersion}>"
