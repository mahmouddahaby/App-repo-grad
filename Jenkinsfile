pipeline {
  agent {
      label "agent"
  }

  stages {
    stage('Build Docker image') {
      steps {
        script {
          sh "docker build -t gcr.io/silicon-smithy-377208/iti-grad ./hello-world/"
          sh "docker push gcr.io/silicon-smithy-377208/iti-grad"
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        script {
          sh "kubectl apply -f app-k8s/deployment.yaml"
          sh "kubectl apply -f app-k8s/service.yaml"
        }
      }
    }
  }
}
