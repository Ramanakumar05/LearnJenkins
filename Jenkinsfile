pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-node-app'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo "📥 Checking out code from GitHub"
                git branch: 'main', url: 'https://github.com/Ramanakumar05/LearnJenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image"
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Run Docker Container (optional)') {
            steps {
                echo "🚀 Running Docker container"
                sh 'docker run -d -p 3000:3000 $DOCKER_IMAGE'
            }
        }
    }

    post {
        success {
            echo '✅ CI Docker build pipeline completed successfully.'
        }
        failure {
            echo '❌ Something went wrong during the pipeline.'
        }
    }
}
