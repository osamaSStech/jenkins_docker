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
            steps {
                bat 'docker build -t my-node-app .'
            }
        }
    }
}
