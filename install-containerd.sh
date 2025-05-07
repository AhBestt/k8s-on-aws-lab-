# Update & install containerd
sudo apt-get update
sudo apt-get install -y containerd

# Create config directory if not exists
sudo mkdir -p /etc/containerd

# Generate default config file
containerd config default | sudo tee /etc/containerd/config.toml 

# Edit SystemdCgroup = true
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml

# Restart containerd service
sudo systemctl restart containerd
