pipeline {
  agent {
      label "agent"
  }

  stages {
    stage('Build Docker image') {
      steps {
        script {
          def tag = "build-${env.BUILD_NUMBER}"
          sh "docker build -t gcr.io/silicon-smithy-377208/iti-grad:${tag} ."
          sh "docker push gcr.io/silicon-smithy-377208/iti-grad:${tag}"
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
