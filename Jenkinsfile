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

        // Buld Docker Image outside the Container Means Main agen Nodejs one
        stage('Build Docker Image') {
            // This stage uses the top-level agent (node:20-alpine) to build a Docker image.
            // It runs in the same environment as the rest of the pipeline, which is suitable for Node.js tasks.
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }
    }
}
