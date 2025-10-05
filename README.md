DOCKER PROJECT
Overview

Complete CI/CD pipeline using Jenkins, GitHub, Docker, and Docker Hub.
Automates image building, pushing to Docker Hub, and container deployment.
Uses Docker Compose, Docker Swarm, and Docker Stack for orchestration.

Docker Components

Dockerfile: Creates image automatically.
Docker Compose: Runs multiple containers on a single server.
Docker Swarm: Manages multiple servers (cluster).
Docker Stack: Combines Swarm and Compose for deployment.

Process Steps

1. Create 3 servers and install Docker
yum install docker -y
systemctl start docker
systemctl enable docker
systemctl status docker
Run docker swarm init on master and copy the token to worker nodes.

2. Install Jenkins (on Master)
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
amazon-linux-extras install java-openjdk11 -y
yum install git maven jenkins -y
systemctl start jenkins.service

Access Jenkins: http://<Master_Public_IP>:8080

3. Jenkins Pipeline (Build & Push)

Clone GitHub repo.
Build Docker image.
Tag image.
Push image to Docker Hub.

Pipeline example:

pipeline {
    agent any 
    stages {
        stage('Code') { steps { git 'https://github.com/alishehzad-943/docker-project.git' } }
        stage('Build') { steps { sh 'docker build -t $img .' } }
        stage('Tag') { steps { sh 'docker tag $img $repo' } }
        stage('Push') {
            steps {
                sh '''
                    echo $PASSWORD | docker login -u $USERNAME --password-stdin
                    docker push $repo
                '''
            }
        }
    }
}


4. Give Permissions on Master

chmod 777 /var/run/docker.sock
systemctl daemon-reload
systemctl restart docker.service

5. Deployment Pipeline (Docker Stack)

Clone GitHub repository.
Deploy using Docker Stack and Compose file.

Pipeline example:

pipeline {
    agent any
    stages {
        stage('Clone Code') {
            steps { git 'https://github.com/alishehzad-943/docker-project.git' }
        }
        stage('Deploy with Docker Stack') {
            steps { sh 'docker stack deploy -c docker-compose.yml paytm' }
        }
    }
}

Files Description

Dockerfile: Defines Apache web server image.
docker-compose.yml: Defines multiple container services.
Jenkinsfile (Build): Handles build, tag, and push.
Jenkinsfile (Deploy): Handles deployment using Docker Stack.

Result

Automated CI/CD pipeline end to end.
Builds, tags, and pushes Docker images automatically.
Deploys containers across multiple servers using Swarm.
Fully integrated workflow between Jenkins, GitHub, and Docker Hub.
