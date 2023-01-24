pipeline {
    agent none

    stages {
        stage('Npm build & Test') {
            agent {
                docker {
                    image 'node:17-bullseye'
                    }
            }
            steps {
                sh 'npm install'
            }
        }
        stage('Dotnet build & test') {
            steps {
                echo 'Testing..'
            }
        }
    }
}