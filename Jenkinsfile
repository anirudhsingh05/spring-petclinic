pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker')
        DOCKER_REGISTRY = 'madblaze'
        IMAGE_NAME = 'spring-petclinic'
        IMAGE_TAG = "v${BUILD_NUMBER}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} ."
                sh "docker tag ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_REGISTRY}/${IMAGE_NAME}:latest"
            }
        }
        
        stage('Login to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        
        stage('Push to DockerHub') {
            steps {
                sh "docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}"
                sh "docker push ${DOCKER_REGISTRY}/${IMAGE_NAME}:latest"
            }
        }
        stage('Update ArgoCD Manifest') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'git-credentials', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                    script {
                        // Checkout your GitOps repository
                        checkout([$class: 'GitSCM',
                            branches: [[name: 'main']],
                            userRemoteConfigs: [[
                                url: 'https://github.com/anirudhsingh05/spring-petclinic.git',
                                credentialsId: 'git-credentials'
                            ]]
                        ])
                        
                        // Update the image tag in the Kubernetes manifest
                        sh """
                            git config user.email "anirudhsingh05032001@gmail.com"
                            git config user.name "anirudhsingh05"
                            
                            # Configure Git to use credentials
                            git remote set-url origin https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/anirudhsingh05/spring-petclinic.git
                            
                            # Ensure we're on main branch
                            git checkout main || git checkout -b main
                            
                            # Update the deployment file
                            sed -i 's|image: ${DOCKER_REGISTRY}/${IMAGE_NAME}:.*|image: ${DOCKER_REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}|' k8s/deployment.yaml
                            
                            # Add, commit and push changes
                            git add k8s/deployment.yaml
                            git commit -m "Update image tag to ${IMAGE_TAG}"
                            git push -u origin main
                        """
                    }
                }
            }
        }


    }
    
    post {
        always {
            sh 'docker logout'
            cleanWs()
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
 