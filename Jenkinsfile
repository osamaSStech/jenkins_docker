pipeline {
    agent any
    stages {
        stage("checkout") {
            steps {
                checkout scm
            }
        }

        stage("Test") {
            steps {
                bat 'npm i'
                bat 'npm test'
            }
        }

        stage("Build") {
            steps {
                bat 'npm run build'
            }
        }

        stage("Build  Docker Image"){
            when { branch "master" }
            environment {
                DOCKER_REGISTRY = "" // e.g., docker-registry.mycompany.com:5000/teamname/projectname
                VERSION = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()[0..7]
            }
            steps {
                withDockerRegistry([credentialsId: '', url: env.DOCKER_REGISTRY]) {
                    bat """
                        docker build -t %DOCKER_REGISTRY%:%VERSION .
                        docker push %DOCKER_REGISTRY%:%VERSION
                    """
                }
            }
    }
}
