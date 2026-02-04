pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/Bibek-2024/jenkins-test.git'
        GIT_CRED = 'Github-token'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Build running..."
            }
        }
    }

    post {
        always {
            script {
                def status = currentBuild.currentResult
                def trigger = currentBuild.getBuildCauses()[0].shortDescription
                def time = new Date().format("EEE MMM dd HH:mm:ss yyyy", TimeZone.getTimeZone('UTC'))

                sh """
                echo "| ${BUILD_NUMBER} | ${JOB_NAME} | ${status} | ${trigger} | ${time} |" >> README.md
                """
            }

            withCredentials([usernamePassword(
                credentialsId: "${GIT_CRED}",
                usernameVariable: 'GIT_USER',
                passwordVariable: 'GIT_TOKEN'
            )]) {
                sh """
                git config user.name "Jenkins Bot"
                git config user.email "jenkins@automation.local"
                git add README.md
                git commit -m "Auto update build history [#${BUILD_NUMBER}]" || echo "No changes"
                git push https://${GIT_USER}:${GIT_TOKEN}@github.com/Bibek-2024/jenkins-test.git HEAD:main
                """
            }
        }

        success {
            emailext(
                to: 'bibekkumarsahu2011@gmail.com',
                subject: "✅ SUCCESS: ${JOB_NAME} #${BUILD_NUMBER}",
                mimeType: 'text/html',
                body: """
                <h2 style="color:green;">Build Successful</h2>
                <b>Job:</b> ${JOB_NAME}<br>
                <b>Build:</b> #${BUILD_NUMBER}<br>
                <b>Time:</b> ${new Date()}<br>
                <b>URL:</b> <a href="${BUILD_URL}">${BUILD_URL}</a>
                """
            )
        }

        failure {
            emailext(
                to: 'bibekkumarsahu2011@gmail.com',
                subject: "❌ FAILED: ${JOB_NAME} #${BUILD_NUMBER}",
                mimeType: 'text/html',
                body: """
                <h2 style="color:red;">Build Failed</h2>
                <b>Job:</b> ${JOB_NAME}<br>
                <b>Build:</b> #${BUILD_NUMBER}<br>
                <b>Check Logs:</b> <a href="${BUILD_URL}">${BUILD_URL}</a>
                """
            )
        }
    }
}
