DOCKER PROJECT

Overview
Complete CI/CD pipeline using Jenkins, GitHub, Docker, and Docker Hub.
Automates image creation, pushing to Docker Hub, and deployment on servers.
Uses Docker Compose, Swarm, and Stack for multi-container and multi-server orchestration.

Docker Components
Dockerfile: To create image automatically.
Docker Compose: To create multiple containers on a single server.
Docker Swarm: To create containers on multiple servers.
Docker Stack: Combination of Docker Swarm and Docker Compose.

Process Steps
Create 3 servers and install Docker on all.
Initialize Docker Swarm on master and join worker nodes using token.
Install Jenkins on master node.
Configure Jenkins and create a new pipeline job.
Give Docker permissions on master for image building.
Write Docker Compose file for multiple services.
Deploy application through Jenkins pipeline using Docker Stack.

Files Used
Dockerfile
docker-compose.yml
Jenkinsfile (Build and Push)
Jenkinsfile (Deploy)

Result
Automated CI/CD pipeline with Jenkins and Docker.
Builds, tags, and pushes Docker images automatically.
Deploys multiple containers on multiple servers using Docker Swarm.
Complete integration between Jenkins, GitHub, and Docker Hub.
