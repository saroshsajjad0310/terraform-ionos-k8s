For windows:
Installing Chocolatey
choco install terraform
choco install kubernetes-cli


For Node creation: terraform > main.rf
terraform init
terraform validate
terraform apply

For Kubenetes:
Download the config file "kubeconfig.yaml"
and place it .kube directory of C:/.

set KUBECONFIG=/path/to/your/generated/kubeconfig.yaml

# Run config files

kubectl apply -f prometheus-config.yaml
kubectl apply -f blackbox-config.yaml

# Run deployment files

kubectl apply -f blackbox-exporter-deployment.yaml
kubectl apply -f prometheus-deployment.yaml
kubectl apply -f grafana-deployment.yaml


# Run Service files
kubectl apply -f grafana-service.yaml
kubectl apply -f blackbox-exporter-service.yaml
kubectl apply -f prometheus-service.yaml

# Add Prometheus configuration in Grafana
# Add visual panel for your website
