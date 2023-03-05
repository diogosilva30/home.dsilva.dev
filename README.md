🏡 # home.dsilva.dev

Welcome to my open-source repository for my Home Assistant deployment! I've built this project to showcase my expertise in deploying Home Assistant on a self-hosted server using the latest tools and technologies. 🚀

🛠️ Tools and Technologies
Here are the tools and technologies I've used to build this project:

- Docker 🐳 - efficient and scalable deployment
- Terraform 🏗️ - infrastructure management and provisioning on my Proxmox datacenter, with Terraform state being securely stored on a on-premises S3 server.
- Ansible 🤖 - automating the installation and configuration of software on the infrastructure
- Cloudflare Tunnel 🔒 - secure and remote access to Home Assistant instance from anywhere
- Tailscale VPN 🌐 - easy and secure authentication to private network
- GitHub Pipelines 🚦 - automated testing and deployment


🔒 Cloudflare Tunnel Automation
Cloudflare Tunnel provides secure access to my Home Assistant instance from anywhere, without the need to expose any ports publicly. I've automated the provisioning of the Cloudflare Tunnel using Terraform and Ansible. 🔨

🌐 Tailscale VPN for Authentication
I've implemented Tailscale to authenticate the GitHub CI runner to my private network so that it can deploy Terraform on my Proxmox data center. Tailscale provides a secure and easy way to connect the CI runner to my private network without the need for complex network configurations. 🔑

📈 GitHub Pipelines for Automation
I've used GitHub Pipelines to automate the testing and deployment of this project. This ensures that any changes made to the code are thoroughly tested and deployed to production in a consistent and reliable manner. 🤖

📖 Documentation
For more information on how to deploy this project, please refer to the documentation in the repository. The documentation includes details on how to configure and run Ansible playbooks to automatically install and configure the necessary software on the provisioned infrastructure, including the Cloudflare Tunnel for secure access to the Home Assistant instance. 📚

Thank you for checking out my project! Feel free to fork the repository and customize it to your needs. 😄
