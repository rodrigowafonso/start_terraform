pipeline {
    agent any

    stages {

        stage ("Realizando o Checkout do código no repositório") {

            steps {

                git url: 'git@github.com:rodrigowafonso/start_terraform.git', branch: 'main'
                sh 'echo funcionando'
                sh 'ls -la'
            }

        }
    }

}