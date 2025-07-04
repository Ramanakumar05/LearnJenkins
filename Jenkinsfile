pipeline{
    agent any
    tools{
        nodejs "nodejs-24"
    }

    stages{
        stage("Printing")
        {
            steps{
                sh "echo "Hello, Jenkins!""
            }
        }
        stage("Checkout")
        {
            steps{
                git 'https://github.com/Ramanakumar05/LearnJenkins.git'
            }
        }
        stage("install dependencies")
        {
            steps{
                sh 'npm install'
            }
        }
        stage("Run Tests")
        {
            steps{
                sh 'npm test'
            }
        }
        stage('Publish Test Report') {
            steps {
                junit 'test-results/junit.xml'
            }   
        }
    }
}