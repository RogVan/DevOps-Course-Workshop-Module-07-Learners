pipeline {
    agent none

    stages {
        stage('Npm build & Test') {
            agent 'node:17-bullseye'
            steps {
                npm 'install'
            }
        }
        stage('Dotnet build & test') {
            steps {
                echo 'Testing..'
            }
        }
    }
}