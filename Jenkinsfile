pipeline {
    agent any

    stages {
        stage('Dotnet build & test') {
            agent {
                docker {
                    image 'mcr.microsoft.com/dotnet/sdk'
                    }
            }
            steps {
                echo 'Testing..'
                sh 'dotnet build'
            }
        }
        // stage('Npm build & Test') {
        //     agent {
        //         docker {
        //             image 'node:17-bullseye'
        //             }
        //     }
        //     steps {
        //         sh 'npm install'
        //         sh 'npm build'
        //     }
        // }
    }
}