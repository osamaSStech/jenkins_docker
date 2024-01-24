pipeline{
    agent any
    stages {
        stage("checkout") {
            steps{
                checkout scm
            }
        }

        stage("Test"){
            steps{
                sh 'npm i'
                sh 'test'
            }
        }

        stage("Build"){
            steps{
                sh 'npm run build'
            }
        }
    }
}
