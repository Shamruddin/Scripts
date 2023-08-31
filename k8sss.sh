---------------------------------------- Kubeadm Installation ------------------------------------------ 

-------------------------------------- Both Master & Worker Node ---------------------------------------
sudo su
apt update -y
apt install docker.io -y

systemctl start docker
systemctl enable docker

curl -fsSL "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg
echo 'deb https://packages.cloud.google.com/apt kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list

apt update -y
apt install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y

##To connect with cluster execute below commands on master node and worker node respectively
--------------------------------------------- Master Node -------------------------------------------------- 
sudo su
kubeadm init

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

kubeadm token create --print-join-command
  

------------------------------------------- Worker Node ------------------------------------------------ 
sudo su
kubeadm reset pre-flight checks
-----> Paste the Join command on worker node and append `--v=5` at end

#To verify cluster connection  
---------------------------------------on Master Node-----------------------------------------

kubectl get nodes 


# worker
# kubeadm join 172.31.84.66:6443 --token n4tfb4.grmew1s1unug0get     --discovery-token-ca-cert-hash sha256:c3fda2eaf5960bed4320d8175dc6a73b1556795b1b7f5aadc07642ed85c51069 --v=5
# kubeadm reset pre-flight checks
# kubeadm token create --print-join-command
# kubectl label node ip-172-31-20-246 node-role.kubernetes.io/worker=worker
# kubectl label nodes ip-172-31-92-99 kubernetes.io/role=worker
# kubectl config set-context $(kubectl config current-context) --namespace=dev






---------------------installation on aws linux k8s------------------------------------

1. Launch an instance from an Amazon Linux 2 or Amazon Linux AMI.
2. Connect to your instance.
3. Update the packages and package caches you have installed on your instance.
`
yum update -y

4. Install the latest Docker Engine packages.

Amazon Linux 2 amazon-linux-extras install 
docker yum install docker -y

5. Start the Docker service.

systemctl start docker 
systemctl enable docker

6. Install Conntrack:

yum install conntrack -y

7. Install k8

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube


8. Start Minikube

/usr/local/bin/minikube start --force --driver=docker

/usr/local/bin/minikube version

9. Install kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

/usr/local/bin/kubectl version

10. Make the DB up

11.yum install maven -y	

12. Create the docker image

docker build -t praveensingam1994/springboot-crud-k8s:1.0 .

13. docker login


14. /usr/local/bin/kubectl  apply -f app-deployment.yaml

15. /usr/local/bin/kubectl  get svc

16.  /usr/local/bin/minikube ip

17. http://<minikubeIP>:31125/orders


18. PUT PORT FORWARD

/usr/local/bin/kubectl port-forward --address 0.0.0.0 svc/springboot-crud-svc 8080:8080 &

[HOST PORT TO CONTAINER PORT 


kubectl port-forward --address 0.0.0.0 svc/{your service name} {external port to the Internet}:{your service port, the port your app is listening on in it's container}

for example, if my service is named badstore and is listening on 80

kubectl port-forward --address 0.0.0.0 svc/badstore 8888:80

------flask-app ----------
kubectl port-forward --address 0.0.0.0 svc/flask-app-service 5000:80 &






------------------install minikube-------------------------
# Steps:-

# For Docker Installation
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER && newgrp docker

# For Minikube & Kubectl
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube 

sudo snap install kubectl --classic
minikube start --driver=docker

-------calculator app for nginx--------
https://github.com/sumanprasad007/cicd-on-kubernetes.git
kubectl port-forward svc/my-service 30007:80 --address 0.0.0.0 &

------user profile app ----------------------------
https://gitlab.com/nanuchi/k8s-in-1-hour.git
 kubectl port-forward --address 0.0.0.0 svc/webapp-service 3000:3000 &






