pipeline {
    agent any

    

    environment {
        IMAGE_NAME = 'myapp:latest'
    }

    stages {
        stage('Clone') {
            steps {
                git url: 'https://github.com/charan-creator-maker/cherry-repo.git',branch:'main'
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
                sh 'docker run -d -p 8080:8080 --name myapp-container-1 $IMAGE_NAME'
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
