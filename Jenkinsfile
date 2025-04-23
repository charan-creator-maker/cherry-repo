pipeline {
    agent any

    tools {
        maven 'Maven_3.8.1' // Configure this Maven in Jenkins Global Tools
    }

    environment {
        IMAGE_NAME = 'myapp:latest'
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/your-username/ci-cd-java-docker.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 8080:8080 --name myapp-container $IMAGE_NAME'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            sh 'docker rm -f myapp-container || true'
        }
    }
}
