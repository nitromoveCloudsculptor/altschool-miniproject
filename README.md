**Mini Project: Incorporating Terraform and Ansible**

This mini project demonstrates the use of Terraform for infrastructure provisioning, including modularization for EC2 instances, Elastic Load Balancer (ELB), and AWS Route 53. Additionally, Ansible is utilized for configuring and deploying Apache on the EC2 instances.

**Terraform Modules**: I employed Terraform modules to enhance the project's reusability.

ec2: Defines EC2 instances.

elb: Configures an Elastic Load Balancer.

route53: Sets up DNS records using AWS Route 53.

**Terraform Files**

main.tf: Orchestrates the Terraform modules.

outputs.tf: Specifies output variables.

variables.tf: Defines input variables.

**Bash script**

I employed a Bash script to export the public IP addresses of the three instances into the host-inventory file.


**Ansible playbook**

The Ansible playbook generates a script that utilizes the host-inventory file created by Terraform. This script installs Apache, sets the timezone to Africa/Lagos, and showcases a straightforward HTML page, ensuring clear identification across all three EC2 instances.
