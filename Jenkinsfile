pipeline{
     agent any
     stages{
        stage('SCM Checkout'){
            steps{
                git credentialsId: 'GIT_CREDENTIALS', url:  'https://github.com/kishorethakur1998/3-tier_app.git',branch: 'master'
            }
        }

        
        stage(" Maven Clean Package"){
            steps{
                #install maven in jenkins cli
                sh "mvn clean package"
            }      
        } 
        
        
        stage('Build Docker Image'){
            steps{
                sh 'docker build . -t 251219981642/spring-boot-mongo'
            }
        }
        
        stage('Push Docker Image'){
            steps{
                withCredentials([string(credentialsId: 'DOKCER_HUB_PASSWORD', variable: 'DOKCER_HUB_PASSWORD')]) {
                    sh "docker login -u 251219981642 -p ${DOKCER_HUB_PASSWORD}"
                }
                sh 'docker push 251219981642/spring-boot-mongo'
            }
        }
        stage('Deploy to kubernetes cluster'){
            agent {label "KOPS"}
                steps{
                    sh 'kubectl apply -f springbootapp.yml'
                }
            }
     
    }
     
}
