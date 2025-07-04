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
        // Inside a stage, you can override the top-level agent for just that stage.
        agent{
            // Your main pipeline uses node:20-alpine (good for Node.js tasks like npm install and npm test).But: To build Docker images, you need the Docker CLI, which is not included in node:20-alpine. So, in the "Build Docker Image" stage, you specify a different agent: This tells Jenkins to run this stage in a container with Docker installed.

            // Summary 
            // Top-level agent: Used for most stages (Node.js work). Stage-level agent: Used when you need a different environment (like Docker for building images). This approach keeps your pipeline flexible and ensures each stage has the right tools.


            docker {
                image 'docker:latest'
                args '-u root:root'
            }
        }
        steps {
            script {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
    }
    }
}