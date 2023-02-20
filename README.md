# GCP-project
gcp project
tool:
1-terraform :Terraform is an open-source infrastructure as a code software.
2-GKE google kubernates engine:Google Kubernetes Engine (GKE) is a managed, production-ready environment for running containerized applications.
3-GCR google container registery:Store, manage, and secure your Docker container images.
4-docker:Docker is a software tool used to deliver software in containers.
5-Gcloud:The Google Cloud CLI is a set of tools to create and manage Google Cloud resources. You can use these tools to perform many common platform tasks from the command line or through scripts and other automation.
Network contain :
1-VPC
2- 2 Subnet
3-NAT Gateway and Router
4-Firewall to allow SSH Connection
First Step: 
  Create Infrastructure :
  1-git clone https://github.com/abdelrahman1421/GCP_FInal_Project.git
  2-terraform init
  3-terraform plan
  4-terraform apply
Second Step:
  Connect To GKE Usnig Pastion VM :
   1.Install Git:
   sudo apt-get install git
   2. Install Kubectl:
   sudo apt-get install kubectl
   3. Install GKE gcloud auth Plugin
   sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
   4. Install Docker&Connect to GKE Cluster
   sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
   sudo apt update
   apt-cache policy docker-ce
   sudo apt install docker-ce -y
   sudo systemctl status docker
   sudo usermod -aG docker ${USER}
   Connect to GKE Cluster
   gcloud container clusters get-credentials project-cluster --zone us-central1-a --project abde-367812
