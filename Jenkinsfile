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
                AWS_TERRAFORM_TFSTATE = credentials('AWS_TERRAFORM_TFSTATE')

            }

            steps {

                script {

                    sh 'terraform init \
                        -backend-config="access_key=AWS_ACCESS_KEY_ID" \
                        -backend-config="secret_key=AWS_SECRET_ACCESS_KEY" \
                        -backend-config="bucket=AWS_NAME_BUCKET" \
                        -backend-config="region=AWS_REGION"'
                    sh 'terraform fmt'
                    sh 'terraform plan --auto-aprove'
                    sh 'terraform apply --auto-aprove'

                }
            }
        }

    }

}