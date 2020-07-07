# istio-study

## Requirement
- istioctl version
  - client version: 1.6.4
  - control plane version: 1.6.4
  - data plane version: 1.6.4

## Terraform
- `cd ./eks/terraform`
- `terraform init`
- `terraform plan`
- `terraform apply`

## istioctl
- `istioctl install --set profile=demo`
### kiali
- `istioctl dashboard kiali`
- user/pass: `admin/admin`
### aws-istio-example
- `k apply -f ./istio-on-amazon-eks-master`