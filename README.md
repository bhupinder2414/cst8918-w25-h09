# Hybrid-H09 Azure Kubernetes Service (AKS) Cluster with Terraform

## Background
As the Systems Engineer on your product development team, you have been tasked with creating an Azure Kubernetes Service (AKS) cluster using Terraform. The AKS cluster will be used to deploy a sample application that includes a frontend (using Vue), two backend services (one built with Node.js, one with Rust), and a message broker (RabbitMQ).
Other team members have completed the application code and have provided you with a sample Kubernetes configuration file that you will use to deploy the application to the AKS cluster.

## Project Overview

The project aims to automate the infrastructure setup for a Kubernetes cluster on Azure using Terraform. It includes the following resources:

- A minimum of 1 node and a maximum of 3 nodes.
- Created in a new resource group.
- Use the latest Kubernetes version.
- Use the "Standard_B2s" VM size.
- Use the "SystemAssigned" managed identity.

## Requirements

Before you begin, ensure you have the following prerequisites:

- **Terraform** installed. You can install it from [here](https://www.terraform.io/downloads).
- **Azure CLI** installed. Follow the installation guide [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
- An **Azure account**. You can create an Azure account [here](https://azure.microsoft.com/en-us/free/).

## Project Structure

## How to Use

### 1. Clone the repository

```bash
git clone https://github.com/bhupinder2414/cst8918-w25-h09.git
cd cst8918-w25-h09
```
### 2. Initialize Terraform
Run the following command to initialize the Terraform configuration. This will download the necessary providers and modules.
```bash
terraform init
```
### 3. Set your Azure credentials
Make sure you're logged in to Azure using the Azure CLI:
```bash
az login
```
### 4. Plan the Infrastructure
Run the following command to see the execution plan. This will show you the changes Terraform will apply to your Azure environment.
```bash
terraform plan
```
### 5. Apply the Configuration
Once you're satisfied with the plan, apply the changes to your Azure environment by running:
```bash
terraform apply
```
### 6. Deploy the application
```bash
kubectl apply -f sample-app.yaml
```
#### 7. Verify the application is running
```bash
kubectl get pods
kubectl get services
```
Use the external IP address of the store-front service to access the application in a web browser.
### 8. Clean up resources

When you're done with the application, you can clean up the resources you created in your Azure account to avoid incurring more charges.
You can use kubectl to delete the pods.
```bash
kubectl delete -f sample-app.yaml
```
You can use terraform to destroy the infrastructure resources.
```bash
terraform destroy
```
### 9. License
This project is licensed under the MIT License - see the LICENSE file for details.
