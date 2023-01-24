pipeline {
    agent any

    environment {
        DOTNET_CLI_HOME = '/tmp/DOTNET_CLI_HOME'
        XDG_DATA_HOME = '/tmp'
    }

    stages {
        stage('Dotnet build') {
            agent {
                docker {
                    image 'mcr.microsoft.com/dotnet/sdk'
                    }
                    }
            steps {
                sh 'dotnet build'
                }
            }
        
        stage('Dotnet test') {
            agent {
                docker {
                    image 'mcr.microsoft.com/dotnet/sdk'
                    }
                    }
            steps {
                sh 'dotnet test'
                }
            }

        stage('Npm install') {
            agent {
                docker {
                    image 'node:17-bullseye'
                    }
                }
            steps {
                dir('./DotnetTemplate.Web') {
                    sh 'npm install'
                }
            }
        }
        
        stage('Npm build') {
            agent {
                docker {
                    image 'node:17-bullseye'
                    }
            }
            steps {
                dir('./DotnetTemplate.Web') {
                    sh 'npm run build'
                }
            }
        }

        stage('Npm test') {
            agent {
                docker {
                    image 'node:17-bullseye'
                    }
            }
            steps {
                dir('./DotnetTemplate.Web') {
                    sh 'npm t'
                }
            }
        }

        stage('Npm run lint') {
            agent {
                docker {
                    image 'node:17-bullseye'
                    }
            }
            steps {
                dir('./DotnetTemplate.Web') {
                    sh 'npm run lint'
                }
            }
        }
    }
}