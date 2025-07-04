pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'ramana0410/my-node-app'
        DOCKER_CREDENTIALS_ID = 'dockerhub'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo "📥 Checking out code from GitHub"
                git branch: 'main', url: 'https://github.com/your-username/your-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image"
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo "🔐 Logging into DockerHub and pushing image"
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $DOCKER_IMAGE
                    '''
                }
            }
        }
    }

    post {
        success {
            echo '✅ Docker image pushed to DockerHub!'
        }
        failure {
            echo '❌ Build failed!'
        }
    }
}
