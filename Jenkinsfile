pipeline {

    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-northeast-2'
        TF_IN_AUTOMATION   = 'true'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Version') {
            steps {
                sh '''
                    terraform version
                    aws sts get-caller-identity
                '''
            }
        }

        stage('Terraform Format') {
            steps {
                sh '''
                    terraform fmt -check -recursive
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    terraform init
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                    terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    terraform plan \
                      -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                    terraform apply -auto-approve tfplan
                '''
            }
        }

        stage('Terraform Outputs') {
            steps {
                sh '''
                    terraform output
                '''
            }
        }
    }

    post {

        success {
            echo 'Terraform infrastructure successfully created through Jenkins.'
        }

        failure {
            echo 'Terraform pipeline failed. Check the Jenkins console output.'
        }
    }
}
