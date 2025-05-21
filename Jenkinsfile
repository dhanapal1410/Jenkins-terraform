pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/dhanapal1410/Jenkins-terraform.git'
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

    stage('Terraform Init') {
      steps {
        withCredentials([
          usernamePassword(credentialsId: 'aws-credentials', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        withCredentials([
          usernamePassword(credentialsId: 'aws-credentials', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          sh 'terraform plan'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        input message: 'Approve to apply?'
        withCredentials([
          usernamePassword(credentialsId: 'aws-credentials', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          sh 'terraform apply -auto-approve'
        }
      }
    }
  }
}



