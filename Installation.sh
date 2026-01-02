sudo apt update
 
sudo apt install openjdk-17-jdk -y

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key  # downloads jenkins.io.key to access jenkins server 
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \ 
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null  # adds jenkins repo in apt repository 

sudo apt update

sudo apt install jenkins

sudo systemctl enable jenkins 

