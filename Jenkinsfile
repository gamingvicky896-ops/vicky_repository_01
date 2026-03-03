pipeline {
    agent any

    environment {
        IMAGE_NAME = "myapp"
        DOCKER_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    credentialsId: 'git',
                    url: 'git@github.com:gamingvicky896-ops/vicky_repository_01.git'
            }
        }

        stage('Build Application') {
            steps {
                echo "Building application..."
                sh 'echo Build completed successfully'
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running tests..."
                sh 'echo Tests completed successfully'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${IMAGE_NAME}:${DOCKER_TAG} ."
            }
        }

        stage('Deploy (Local Docker)') {
            steps {
                echo "Deploying container..."

                sh """
                docker rm -f myapp-container || true
                docker run -d -p 8090:80 --name myapp-container ${IMAGE_NAME}:${DOCKER_TAG}
                """
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully"
        }
        failure {
            echo "Pipeline failed. Please check logs."
        }
    }
}
