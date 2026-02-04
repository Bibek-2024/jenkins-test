pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Build') {
            steps {
                echo 'Webhook triggered build'
                sh '''
                echo "=============================="
                echo " Jenkins Auto Build Triggered "
                echo " Date: $(date)"
                echo "=============================="
                '''
            }
        }
    }

    post {
        success {
            emailext(
                subject: "SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: """
Job: ${env.JOB_NAME}
Build Number: ${env.BUILD_NUMBER}
Status: SUCCESS
Triggered by GitHub Push
Build URL: ${env.BUILD_URL}
""",
                to: "bibekkumarsahu2011@gmail.com"
            )
        }

        failure {
            emailext(
                subject: "FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: """
Job: ${env.JOB_NAME}
Build Number: ${env.BUILD_NUMBER}
Status: FAILED
Check logs: ${env.BUILD_URL}
""",
                to: "bibekkumarsahu2011@gmail.com"
            )
        }
    }
}
