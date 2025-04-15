pipeline {
    agent any

    environment {
        IMAGE_NAME = "hello-charan-image"
        CONTAINER_NAME = "hello-charan-container"
        BRANCH = "main"
        REPO_URL = "https://github.com/charan-creator-maker/cherry-repo"

    stages {
        stage('Clone') {
            steps {
                git branch: "${BRANCH}", url: "${REPO_URL}"
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Stop Old Container') {
            steps {
                sh """
                if [ \$(docker ps -q -f name=${CONTAINER_NAME}) ]; then
                    docker stop ${CONTAINER_NAME}
                    docker rm ${CONTAINER_NAME}
                fi
                """
            }
        }

        stage('Run New Container') {
            steps {
                script {
                    dockerImage.run("-d --name ${CONTAINER_NAME} -p 8080:8080")
                }
            }
        }
    }
}
