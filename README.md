# Multi-Region S3 Buckets with Cross-Region Replication

## Overview
This Terraform project creates an AWS S3 bucket in two different regions with **Cross-Region Replication (CRR)** enabled. It ensures high availability and disaster recovery by replicating objects from a primary S3 bucket to a secondary bucket.

### **Services Used**
- **S3**: For object storage with versioning and replication.
- **IAM**: To manage permissions for cross-region replication.
- **CloudFront**: (Optional) To serve content globally with caching.
- **Terraform**: Infrastructure as Code (IaC) for automating AWS resource deployment.

## **Architecture**
1. A **primary S3 bucket** in a chosen AWS region.
2. A **secondary S3 bucket** in a different AWS region for replication.
3. **IAM Role and Policies** to allow replication between buckets.
4. **Cross-Region Replication (CRR)** enabled with proper permissions.

---

## **Folder Structure**
```
├── modules/
│   ├── s3/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── iam/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── cloudfront/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── README.md
```

---

## **Pre-requisites**
- **AWS Account** with credentials configured.
- **Terraform** installed ([Download Terraform](https://www.terraform.io/downloads)).
- **AWS CLI** installed and configured (`aws configure`).
- An **AWS IAM profile** (e.g., `devops-cloud`) set up in `~/.aws/credentials`.

---

## **Configuration**
### **Set AWS Regions and Bucket Names**
Modify **`terraform.tfvars`** to set your AWS regions and bucket names:
```hcl
aws_region_primary  = "us-east-1"
aws_region_secondary = "us-west-2"
primary_bucket_name = "my-primary-bucket"
secondary_bucket_name = "my-secondary-bucket"
```

---

## **Deployment Steps**
### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/YOUR_GITHUB_USERNAME/terraform-s3-replication.git
cd terraform-s3-replication
```

### **2️⃣ Initialize Terraform**
```sh
terraform init
```

### **3️⃣ Plan the Changes**
```sh
terraform plan
```

### **4️⃣ Apply the Configuration**
```sh
terraform apply -auto-approve
```

### **5️⃣ Verify the Setup**
Check if the primary bucket is created:
```sh
aws s3 ls --profile devops-cloud --region us-east-1
```
Check if replication is enabled in the AWS S3 console.

---

## **Destroying the Infrastructure**
If you want to remove all the created resources, run:
```sh
terraform destroy -auto-approve
```

---

## **Next Steps**
- **Enable CloudFront** for content delivery.
- **Add lifecycle policies** for data retention.
- **Automate deployments** with GitHub Actions or AWS CodePipeline.

---

## **Contributing**
Feel free to raise an issue or submit a pull request if you want to improve the project.

---

## **License**
This project is licensed under the MIT License.

---

### 🎯 Happy Terraforming! 🚀