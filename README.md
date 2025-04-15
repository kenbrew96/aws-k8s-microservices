## ✅ PROJECT 2: Kubernetes Microservices on AWS EKS

### 📁 GitHub Structure
```
aws-k8s-microservices/
├── terraform/
│   ├── eks.tf
│   ├── provider.tf
├── kubernetes/
│   ├── deployment.yaml
│   ├── service.yaml
├── README.md 
```

### 📄 `provider.tf`
```hcl
provider "aws" {
  region = "us-east-1"
}
```
**Explanation**: This tells Terraform to use AWS as the provider and specifies the region where resources will be deployed.

### 📄 `eks.tf`
```hcl
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster"
  cluster_version = "1.27"
  subnets         = ["subnet-1", "subnet-2"]
  vpc_id          = "vpc-id"
  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
    }
  }
}
```
**Explanation**: Uses an open-source Terraform module to create an EKS cluster with a managed node group.

### 📄 `deployment.yaml`
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```
**Explanation**: Creates 2 replicas of a pod running Nginx.

### 📄 `service.yaml`
```yaml
apiVersion: v1
kind: Service
metadata:
  name: web-service
spec:
  selector:
    app: web
  ports:
    - port: 80
      targetPort: 80
  type: LoadBalancer
```
**Explanation**: Deploys 2 pods and exposes them using AWS ELB.
