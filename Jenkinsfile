pipeline {
    agent any

    environment {
        DOTNET_CLI_HOME = '/tmp/DOTNET_CLI_HOME'
        XDG_DATA_HOME = '/tmp'
    }

    stages {
        stage('Build backend') {
            agent {
                docker {
                    image 'mcr.microsoft.com/dotnet/sdk:6.0'
                    }
                    }
            steps {
                sh 'dotnet build'
                }
            }
        
        stage('Test backend') {
            agent {
                docker {
                    image 'mcr.microsoft.com/dotnet/sdk:6.0'
                    }
                    }
            steps {
                sh 'dotnet test'
                }
            }

        stage('Install frontend dependencies') {
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
        
        stage('Build frontend') {
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

        stage('Test frontend') {
            agent {
                docker {
                    image 'node:17-bullseye'
                    }
            }
            steps {
                dir('./DotnetTemplate.Web') {
                    sh 'npm run test-with-coverage'
                    publishCoverage adapters: [istanbulCoberturaAdapter('./coverage/cobertura-coverage.xml')], checksName: '', sourceFileResolver: sourceFiles('NEVER_STORE')
                }
            }
        }

        stage('Run linter') {
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