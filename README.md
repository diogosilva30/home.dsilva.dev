# 🏡 home.dsilva.dev
Welcome to my open-source repository for my Home Assistant deployment! I've built this project to showcase my expertise in deploying Home Assistant on a self-hosted server using the latest tools and technologies. 🚀

🛠️ Tools and Technologies
Here are the tools and technologies I've used to build this project:

- Home Assistant Supervised Install 🏠 - a self-hosted and flexible way to run Home Assistant on Linux.
- Debian 11 Bullseye 🐂 - a Linux distribution used as the base image for the Home Assistant Supervised installation.
- Ansible 🤖 - automating the installation and configuration of software on the infrastructure, including the Home Assistant Supervised installation and the cloudflare tunnel for remote access to home assistant instance.
- Cloudflare Tunnel 🔒 - secure and remote access to Home Assistant instance from anywhere.
- Tailscale VPN 🌐 - easy and secure authentication of GitHub's runner to my private network.
- GitHub Pipelines 🚦 - automated testing and deployment.

## 🏠 Home Assistant Supervised Installation
I'm running a Home Assistant Supervised installation on a Debian 11 Bullseye image. This self-hosted and flexible way of running Home Assistant on Linux provides me with complete control over my smart home and enables me to integrate it with a variety of third-party devices and services. The Home Assistant Supervised installation was set up using Ansible automation.

## 🔒 Cloudflare Tunnel Automation
Cloudflare Tunnel provides secure access to my Home Assistant instance from anywhere, without the need to expose any ports publicly. I've automated the provisioning of the Cloudflare Tunnel using Terraform and Ansible. 🔨

## 🌐 Tailscale VPN for Authentication
I've implemented Tailscale to authenticate the GitHub CI runner to my private network so that it can deploy Terraform on my Proxmox data center. Tailscale provides a secure and easy way to connect the CI runner to my private network without the need for complex network configurations. 🔑

## 📈 GitHub Pipelines for Automation
I've used GitHub Pipelines to automate the testing and deployment of this project. This ensures that any changes made to the code are thoroughly tested and deployed to production in a consistent and reliable manner. 🤖

## 📖 Documentation
For more information on how to deploy this project, please refer to the documentation in the repository. The documentation includes details on how to configure and run Ansible playbooks to automatically install and configure the necessary software on the provisioned infrastructure, including the Home Assistant Supervised installation and the Cloudflare Tunnel for secure access to the Home Assistant instance. 📚

Thank you for checking out my project! Feel free to fork the repository and customize it to your needs. 😄