pipeline {
    agent any

    environment {
        DOTNET_CLI_HOME = '/tmp/dotnet_cli_home'
    }

    stages {
        stage('Dotnet build & test') {
            agent {
                docker {
                    image 'mcr.microsoft.com/dotnet/sdk'
                    }
            }
            steps {
                echo 'Testing..'
                // sh 'dotnet build'
            }
        }
        stage('Npm build & Test') {
            agent {
                docker {
                    image 'node:17-bullseye'
                    }
            }
            steps {
                dir('./DotnetTemplate.Web') {
                    sh 'npm install'
                    sh 'npm build'
                }
            }
        }
    }
}