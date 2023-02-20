pipeline {
  agent any

  environment {
    DOCKER_IMAGE_NAME = "hello-ITI"
    DOCKER_REGISTRY_URL = "gcr.io/silicon-smithy-377208"
    GCP_PROJECT_ID = "silicon-smithy-377208"
    KUBECONFIG = credentials('kubeconfig')
    GCP_SERVICE_ACCOUNT = credentials('gcp-service-account')
  }

  stages {
    stage('Build Docker image') {
      steps {
        script {
          def dockerImage = docker.build("${DOCKER_REGISTRY_URL}/${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}")
          withCredentials([serviceAccount("${GCP_SERVICE_ACCOUNT}")]) {
            sh "gcloud auth configure-docker --quiet"
          }
          dockerImage.push()
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        script {
          sh "kubectl apply -f app-k8s/deployment.yaml"
        }
      }
    }
  }
}
