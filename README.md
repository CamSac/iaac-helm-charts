# iaac-helm-charts

## initialization of ArgoCD

```sh
curl -s https://api.github.com/repos/argoproj/argo-cd/tags | jq -r '.[0].name'

kubectl apply -k "https://github.com/argoproj/argo-cd/manifests/crds?ref=<appVersion>"

helm upgrade --install argocd ./charts/argocd --create-namespace --namespace argocd

helm template charts/root-app -s templates/root-app.yaml | kubectl apply -f -

kubectl delete <default-storage-class>

curl -s https://api.github.com/repos/cert-manager/cert-manager/tags | jq -r '.[0].name'

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/<appVersion>/cert-manager.crds.yaml

Apply traefik and cert-manager secrets manually

sudo iptables -t nat -A PREROUTING -p tcp -d 10.0.0.5 --dport 443 -j REDIRECT --to-port 30443
```

## To Do

- create a dependency helm chart to create ingress and certificates

### CRDs that need managing

- argocd

- traefik

- cert-manager

kubectl -n staging run other-app --image alpine --restart Never --rm --stdin --tty -- sh
