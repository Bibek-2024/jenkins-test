pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Code checked out from GitHub'
            }
        }

        stage('Validate Files') {
            steps {
                sh '''
                echo "Listing project files"
                ls -la
                '''
            }
        }

        stage('Archive Website') {
            steps {
                sh '''
                zip -r website.zip .
                '''
                archiveArtifacts artifacts: 'website.zip', fingerprint: true
            }
        }
    }
}
