pipeline {
    agent {
        docker {
            image 'node:20-alpine'
            args '-u root:root -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    environment {
        IMAGE_NAME = 'my-image-name'
    }
    stages {
        stage("Printing") {
            steps {
                sh 'echo "Hello, Jenkins!"'
            }
        }
        stage("Checkout") {
            steps {
                git url: 'https://github.com/Ramanakumar05/LearnJenkins.git', branch: 'main'
            }
        }
        stage("Install Dependencies") {
            steps {
                dir('backend') {
                    sh 'npm install'
                }
            }
        }
        stage("Run Tests") {
            steps {
                dir('backend') {
                    sh 'npm test'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
    }
}