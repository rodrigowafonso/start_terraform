pipeline {
    agent any

    stages {

        stage ("Realizando o Checkout do código no repositório") {

            steps {

                git url: 'https://github.com/rodrigowafonso/start_terraform.git', branch: 'main'
                echo 'Funcionando!!!'
                sh 'ls -la'
            }

        }


        stage ("Provisionando a Infraestrutura e Instância") {

            environment {

                AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
                AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
                AWS_REGION = credentials('AWS_REGION')
                AWS_NAME_BUCKET = credentials('AWS_NAME_BUCKET')
                AWS_TERRAFORM_TFSTATE_START = credentials('AWS_TERRAFORM_TFSTATE_START')

            }

            steps {

                script {

                    sh 'terraform fmt'
                    sh 'terraform init -backend-config="bucket=$AWS_NAME_BUCKET" -backend-config="key=$AWS_TERRAFORM_TFSTATE_START"'
                    sh 'terraform plan --auto-approve'
                    sh 'terraform apply --auto-approve'

                }
            }
        }

    }

}