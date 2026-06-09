# Landing-Zone

Here i create Landing zone from scratch. This repository contains the Infrastructure as Code (IaC) templates and configurations to deploy a secure, scalable, and fully governed Azure Landing Zone.

## 🚀 Project Overview

An Azure Landing Zone is the foundation of an enterprise cloud environment. This project focuses on automated cloud governance, subscription management, networking, and security baselines, ensuring compliance with enterprise standards from the ground up.

## 📁 Repository Structure

Based on the core design, the repository is organized as follows:

*   **`environments/`**: Contains environment-specific configuration files (such as dev, QA, or production variable files).
*   **`modules/`**: Reusable Infrastructure as Code (IaC) modules for components like networking, identity, governance, and logging.
*   **`templates/`**: Core template files defining the underlying architecture baselines.
*   **`azure-pipelines.yml`**: The Azure DevOps CI/CD pipeline definition used to automate the deployment and validation of the landing zone.

---

## 🛠️ Prerequisites

Before deploying this landing zone, ensure you have the following:

1.  An active **Azure Subscription** or Management Group structure with Owner/Contributor access.
2.  An **Azure DevOps** account linked to this repository.
3.  Installed CLI tools locally if testing manually:
    *   Azure CLI
    *   Terraform / Bicep (depending on your IaC preference)

---

## 🤖 CI/CD Deployment with Azure Pipelines

This project uses Azure Pipelines for automated execution. The deployment workflow is managed via the `azure-pipelines.yml` file.

### How to trigger the pipeline:
1. Set up a service connection in your Azure DevOps project pointing to your Azure tenant.
2. Create a new pipeline in Azure DevOps and select this GitHub repository.
3. Point the pipeline to the existing `azure-pipelines.yml` file.
4. Run the pipeline! It will read files from `templates/` and apply configurations based on the `environments/` directory.

---

## 🔒 Security & Best Practices

*   **Least Privilege Access:** Roles and permissions are strictly isolated across subscriptions.
*   **Automated Guardrails:** Built-in validation checks within the CI/CD pipeline.
*   **State Management:** Secure backend configurations for infrastructure state storage.
