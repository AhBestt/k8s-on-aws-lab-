# k8s-on-aws-lab-

Lab 1: Kubernetes Cluster Setup on AWS EC2 using kubeadm

Objective
This lab demonstrates how to set up a basic Kubernetes cluster from scratch using `kubeadm` on AWS EC2 instances.
  - Provision EC2 instances
    -  1 server for control plane
    -  2 server for worker node

Prerequisites
- AWS Account
  -  user with "AdministratorAccess" permissions policies

Step-by-Step Instructions
1.  Create EC2 instance: Config as follows

    <ins>Control Plane</ins>
    -  Ubuntu Server 24.04 LTS
    -  Instance type
        -  t2.medium
    -  Create Key Pair
        -  Key pair name: k8s-node
        -  Key pair type: RSA
        -  Private key file format: .pem
    -  Everything else defaults
    
    <ins>Worker Node</ins>
    -  Ubuntu Server 24.04 LTS
    -  Instance type
        -  t2.medium #normally in real world worker node will be larger than control plane
    -  Key Pair login:
        -  k8s-node
3.  Test Connection via ssh
    1.  Move private key file to standard location ~/.ssh
       'mv ~/Downloads/k8s-node.pem ~/.ssh'
    2. change permission of the key
       'chmod 400 ~/.ssh/k8s-node.pem'
    3. grep public ip from aws console
    4. Connect via ssh
       -  defualt username for ubuntu is ubuntu
         'ssh -i ~/.ssh/k8s-node.pem ubuntu@ipserver'
4. Configure K8s Node
   1.  Disable memory swapping (do for each server)
       'sudo swapoff -a'
   2.  Open port follow the document https://kubernetes.io/docs/reference/networking/ports-and-protocols/
   3.  change hostname adding private ip to each server
       'sudo vim /etc/hosts'
       sethostname
       'sudo hostnamectl set-hostname <name>'
       after change exit and reconnect
5. Install Container Runtime Interface
   -  follow document https://kubernetes.io/docs/setup/production-environment/container-runtimes/

'''Noted'''
If you are using Ubuntu 24.04 you must disable the AppArmor service on your instance to avoid a bug, which prevents you from deleting pods. Run the following commands to do so:

'sudo systemctl stop apparmor.service'

'sudo systemctl disable apparmor.service'

  -  Enable IPv4 packet forwarding 
  -  create and run script "install-containerd.sh"
6. Install kubeadm, kubelet, kubectl
  -  follow document https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
  -  create and run script "install-k8s-component.sh" on all node
7. Initial cluster with kubeadm
  On Controlplane
  
  'sudo kubeadm init'

8. Connect to cluster (kubeconfig&kubectl)
   Kubeconfig Contents

   'sudo vim /etc/kubernetes/admin.conf'

   Referencing Kubeconfig File
   -  File located in "$HOME/.kube/config" folder
   -  

