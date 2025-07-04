pipeline {
    agent {
        docker {
            image 'node:20-alpine'
            args '-u root:root'
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
            agent any // <--- This runs the stage on any available agent (host), not inside node:20-alpine
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
    }
}