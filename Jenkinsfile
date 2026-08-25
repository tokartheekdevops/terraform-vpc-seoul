pipeline {

    agent {
        label 'djworker3'
    }

    environment {
        AWS_DEFAULT_REGION = 'ap-northeast-2'
        AWS_REGION         = 'ap-northeast-2'
        TF_IN_AUTOMATION   = 'true'
    }

    stages {

        stage('Terraform Version and AWS Identity') {
            steps {
                sh '''
                    echo "========================================"
                    echo "Terraform Version"
                    echo "========================================"

                    terraform version

                    echo "========================================"
                    echo "AWS Identity"
                    echo "========================================"

                    aws sts get-caller-identity

                    echo "========================================"
                    echo "Target Region"
                    echo "========================================"

                    echo "$AWS_REGION"
                '''
            }
        }

        stage('Terraform Format') {
            steps {
                sh '''
                    terraform fmt -recursive
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                    terraform init -input=false -migrate-state
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
                        -input=false \
                        -out=tfplan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                    terraform apply \
                        -input=false \
                        -auto-approve \
                        tfplan
                '''
            }
        }

        stage('Terraform Outputs') {
            steps {
                sh '''
                    echo "========================================"
                    echo "Terraform Outputs"
                    echo "========================================"

                    terraform output
                '''
            }
        }
    }

    post {

        success {
            echo "========================================"
            echo "SUCCESS"
            echo "Terraform infrastructure created successfully."
            echo "Target region: ap-northeast-2"
            echo "Jenkins worker: djworker3"
            echo "========================================"
        }

        failure {
            echo "========================================"
            echo "FAILED"
            echo "Terraform pipeline failed."
            echo "Check the Jenkins Console Output."
            echo "========================================"
        }
    }
}
