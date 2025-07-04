pipeline {
    agent {
        docker {
            image 'node:20-alpine'         // 🐳 Lightweight Node.js v20
            args '-u root:root'            // 🔧 Run as root to avoid permission issues
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

        stage("Publish Test Report") {
            steps {
                junit 'backend/test-results/junit.xml' // Modify path if needed
            }
        }
    }
}
