pipeline {
    agent {
        docker {
            image 'node:20-alpine'
            args '-u root:root'
        }
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
                    sh ''
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

        // Buld Docker Image outside the Container 
        stage('Build Docker Image') {
        steps {
            agent{
                docker {
                    image 'docker:latest'
                    args '-u root:root'
                }
            }
            script {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
    }
    }
}