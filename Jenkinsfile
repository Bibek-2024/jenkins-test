pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-nginx-website"
        CONTAINER_NAME = "nginx-website"
        PORT = "8000"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Bibek-2024/jenkins-test.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Run Docker Container') {
            steps {
                sh "docker rm -f ${CONTAINER_NAME} || true"
                sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT}:8000 ${IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo "Docker container is running on port ${PORT}"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
