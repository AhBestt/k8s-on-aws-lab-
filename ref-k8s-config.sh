mkdir -p ~/.kube
sudo cp -i /etc/kubernetes/admin.conf ~/.kube/config

#check owner
ls -l ~/.kube/config
echo $(id -u)
echo $(id -g)

# change owner from root to user
sudo chown $(id -u):$(id -g) ~/.kube/config
ls -l ~/.kube/config
