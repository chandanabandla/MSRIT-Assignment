# MSRIT Assignment-2 code execution procedure
# Deploying and run web applications and databases using the kubernetes cluster on aws cloud

### Step 1: Creating Workers Group
Used Terraform to provision AWS resources to run EC2 worker nodes for Elastic Container Service for Kubernetes.

- Install terraform
- Create a folder and open the terminal
- Run the following commands
  
       [Terraform init .]
 - Added code in a file and saved the file with .tf extension and run the following command
    
        [terraform validate .]
    
        [terraform apply .]
    
Creates the following resources:

- IAM Role and Instance Profile to allow Kubernetes nodes to access other AWS services
- Security Group with rules for EKS workers to allow networking traffic
- AutoScaling Group with Launch Template to configure and launch worker instances

### Step 2: Creating Kubernetes Cluster
- Added code in a file and saved the file with .tf extension and run the following command
    
        [terraform validate .]
    
        [terraform apply .]
    
Creates the following resources:
- EKS cluster of master nodes that can be used together with the worker group to create a full-blown cluster.
- IAM Role to allow the cluster to access other AWS services.
- Security Group which is used by EKS workers to connect to the cluster and kubelets and pods to receive communication.
- The module generates kubeconfig configuration to connect to the cluster using kubectl.

### Step 3: Create the CouchDB master pod
- Use the ouchDB-Master-controller.yml file to create the CouchDB master replication controller in the Kubernetes cluster by running the following command:

   $ kubectl create -f MSRIT-K8s/MSRIT Assignment-2/CouchDB-Master-Controller.yml
   
- To verify that the CouchDB-master controller is up, list the replication controllers you created in the cluster with the kubectl get rc command

   $ kubectl get rc
   
- To verify that the CouchDB-master pod is running, list the pods you created in cluster with the kubectl get pods command:

   $ kubectl get pods
   
### Step 4: Create the CouchDB master service

- Use the CouchDB-Master-Service.yml file to create the service in the Kubernetes cluster by running the kubectl create -f filename command:

   $ kubectl create -f MSRIT-K8s/MSRIT Assignment-2/CouchDB-Master-Service.yml

- To verify that the CouchDB-master service is up, list the services you created in the cluster with the kubectl get services command:

   $ kubectl get services

### Step 5: Create the CouchDB Worker pods

- Use the file CouchDB-Worker-Controller.yml to create the replication controller by running the kubectl create -f filename command:

   $ kubectl create -f MSRIT-K8s/MSRIT Assignment-2/CouchDB-Worker-Controller.yml.txt
      
- To verify that the Couchdb-Worker controller is running, run the kubectl get rc command:

   $ kubectl get rc

- To verify that the CouchDB master and slaves pods are running, run the kubectl get pods command:

   $ kubectl get pods

### Step 6: Create the Couchdb Worker service

- Use the CouchDB-Worker-Service.yml file to create the Couchdb Worker service by running the kubectl create -f filename command:

   $ kubectl create -f MSRIT-K8s/MSRIT Assignment-2/CouchDB-Worker-Service.yml      

- To verify that the CouchDB-Worker service is up, list the services you created in the cluster with the kubectl get services command:

   $ kubectl get services

### Step 7: Create the Tomcat pods

- Use the Tomcat-controller.yml file to create the Tomcat replication controller by running the kubectl create -f filename command:

   $ kubectl create -f MSRIT-K8s/MSRIT Assignment-2/Tomcat-pod.yml

- To verify that the Tomcat replication controller is running, run the kubectl get rc command:

   $ kubectl get rc

- To verify that the Tomcat pods are running (it might take up to thirty seconds to create the pods), list the pods you created in cluster with the kubectl get pods command:

   $ kubectl get pods

### Step 8: Create the Tomcat service

- Use the Tomcat-Service.yml file to create the Tomcat service by running the kubectl create -f filename command:

   $ kubectl create -f MSRIT-K8s/MSRIT Assignment-2/Tomcat-Service.yml
        
- To verify that the Tomcat service is up, list the services you created in the cluster with the kubectl get services command:

   $ kubectl get services

### Result:
We can see the Tomcat application up and running on the browser over 8080 port

# MSRIT Assignment-1 code execution procedure

Create two EC2 Instances in AWS Cloud using

- Install terraform
- Create a folder and open the terminal
- Run the following commands
  
    [Terraform init .]
- Added code in a file and saved the file with .tf extension and run the following command
    
        [terraform validate .]
    
        [terraform apply .]
    
- Creates 3 t2.micro instances
  Where,
  * one is the MSR-test-Instance-1.
  * Second is the MSR-test-Instance-2.
  * Third instance is used as a Ansible Control Machine to handle the deployments.

2. Once these two servers are provisioned, ensure the below following software packages are installed using configuration management tool in both the provisioned instances.

- Used ansible to do the installations.
- Configuring Ansible control server
  * Login to Ansible Control Server
  * Install Ansible
  * Ansible is installed in /etc/ansible
  * Install python
  * Enable password based authentication in AWS machine
    
        [Sudo -i]
    
        [Vi /etc/ssh/sshd_config]
    
    Here change "password based authentication" from "No" to "Yes"
      
        [service sshd restart]
      
        [service sshd status](status should be active)
  * Create user
    
        [adduser ansible]
    
    o Give execute permissions for installations
    
        [visudo]
    
    o Add [ansible ALL:(ALL:ALL) NOPASSWD:ALL]
- Configuring the other 2 Nodes as follows:
  * Login to MSR-test-Instance-1 and MSR-test-Instance-2
    
        [Ssh ansible@PrivateIPAdress]
  
  * Create user as mentioned above with the same user name as ansible.
  * Install python on both the nodes. 
- Enable key-based authentication between machines. So that we dont need to give password every time we login.
  * Login to ACS machine
  * Generate Key
    
        [ssh-keygen]
  * Copy public key into other nodes and also within the ACS machine after logging into as a ansible user
    
        [ssh-copy-id ansible@DNS]
- Working with inventory
  * Create a file and name it as hosts
    
        [vi hosts]
  * Add DNS address of the nodes in it. Give the group name as [Ubuntu]
For Example:

[Ubuntu]

localhost

Node1 DNS

Node2 DNS

- To check whether the machines are established connections
  
     [ansible -m ping all]
- Now execute the play-book which is written using
  
    [Ansible-Playbook -i hosts DeployingSoftware.yml]

3. Create a Docker Container in MSR-test-Instance-1 using Docker Compose file and ensure apache webserver is installed. Try to use configuration management tools to automate the entire installation of apache and deploy a sample html file from a GitHub repository.

- Docker and docker-compose is already installed using ansible on both the nodes.
- Create a folder "MSRTest Instance-1 Docker container" and write the docker, docker-compose and sample.html files inside the folder.    Run the following command from the project root folder.
  
    [Docker-compose up]

4. Create a Docker Container in MSR-test-Instance-2 using Docker Compose file and ensure CouchDB Database is installed. Try to use any configuration management tool to automate the entire installation processes. We should be able to access the Futon - web GUI of CouchDB, from the external system.

- Docker and docker-compose is already installed using ansible on both the nodes.

- Create a docker network
  
    [docker network create couchdb-test]

- Create a docker volume
  
    [docker volume create --name=couchdb-test]

- Create a folder "MSRTest Instance-1 Docker container" and write the docker-compose file inside the folder. Run the following command from the project root folder.
  
    [Docker-compose up]

- To access the web GUI of couchdb, open a browser and type the following
   
            http://13.126.233.159:5984/_utils/
