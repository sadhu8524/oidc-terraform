# Azure OIDC Authentication with GitHub Actions using Terraform

This project sets up secure, secretless authentication between **GitHub Actions** and **Azure** using **OpenID Connect (OIDC)**. It uses **Terraform** to automate the creation of an Azure AD Application, Federated Identity Credential, and Role Assignment.

## 🔧 What This Does

- Creates an Azure AD Application for OIDC login
- Configures a Federated Credential for GitHub Actions
- Assigns a role (e.g., Contributor) to the identity
- Includes a GitHub Actions workflow to test Azure login

## 📁 Project Structure

```
.
├── main.tf                  # Terraform resources for Azure AD and OIDC
├── variables.tf             # Input variables
├── terraform.tfvars         # Values for variables
├── outputs.tf               # Useful outputs (for GitHub secrets)
├── .github/
│   └── workflows/
│       └── azure-oidc-login.yml  # GitHub Actions workflow to test login
├── README.md
```

## 🚀 Usage

1. Install Terraform and authenticate with Azure:
   ```bash
   az login
   terraform init
   terraform apply
   ```

2. Store the output values in GitHub Secrets:
   - `AZURE_CLIENT_ID`
   - `AZURE_TENANT_ID`
   - `AZURE_SUBSCRIPTION_ID`

3. Trigger the GitHub Actions workflow (`azure-oidc-login.yml`) manually or on push.

## 👤 Author

This project was created by **Ashish**, a DevOps and platform engineering enthusiast who enjoys automating secure infrastructure and CI/CD pipelines.

Feel free to fork or reach out on LinkedIn if you’re setting up OIDC for your team!

## 📘 References

- [GitHub Actions - Azure Login](https://github.com/Azure/login)
- [Microsoft Docs - Federated Identity Credential](https://learn.microsoft.com/entra/workload-id/workload-identity-federation)

---

Enjoy secure, secretless deployments! 🎉# oidc-terraform
