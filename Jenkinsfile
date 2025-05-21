pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/dhanapal1410/Jenkins-terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Format Check') {
            steps {
                sh 'terraform fmt -check'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                    terraform plan \
                    -var="aws_access_key=${AWS_ACCESS_KEY_ID}" \
                    -var="aws_secret_key=${AWS_SECRET_ACCESS_KEY}"
                '''
            }
        }

        stage('Terraform Apply') {
            when {
                expression { return currentBuild.result == null || currentBuild.result == 'SUCCESS' }
            }
            steps {
                sh '''
                    terraform apply -auto-approve \
                    -var="aws_access_key=${AWS_ACCESS_KEY_ID}" \
                    -var="aws_secret_key=${AWS_SECRET_ACCESS_KEY}"
                '''
            }
        }
    }
}

