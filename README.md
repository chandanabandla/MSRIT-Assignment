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
We can see the omcat application up and running on the browser over 8080 port
