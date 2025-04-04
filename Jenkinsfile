pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'dockerhub-creds' // Jenkins credentials ID for Docker Hub
        GITHUB_CREDENTIALS = 'github-creds'    // Jenkins credentials ID for GitHub
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git credentialsId: "${GITHUB_CREDENTIALS}", url: 'https://github.com/yourusername/jenkins-pipeline-demo.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image from the Dockerfile
                    sh 'docker build -t yourusername/jenkins-pipeline-demo .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Log into Docker Hub
                    withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS}", usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                    }
                    // Push the Docker image to Docker Hub
                    sh 'docker push yourusername/jenkins-pipeline-demo'
                }
            }
        }
    }
}
