pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Running build steps...'
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
                to: 'bibekkumarsahu2011@gmail.com',
                subject: "✅ SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                mimeType: 'text/html',
                body: """
                <html>
                <body style="font-family: Arial, sans-serif;">
                  <h2 style="color: green;">✔ Jenkins Build Successful</h2>

                  <table border="1" cellpadding="8" cellspacing="0" style="border-collapse: collapse;">
                    <tr><td><b>Project</b></td><td>${env.JOB_NAME}</td></tr>
                    <tr><td><b>Build Number</b></td><td>${env.BUILD_NUMBER}</td></tr>
                    <tr><td><b>Status</b></td><td style="color: green;">SUCCESS</td></tr>
                    <tr><td><b>Triggered By</b></td><td>GitHub Webhook</td></tr>
                    <tr><td><b>Build URL</b></td>
                        <td><a href="${env.BUILD_URL}">Open Build</a></td></tr>
                    <tr><td><b>Console Output</b></td>
                        <td><a href="${env.BUILD_URL}console">View Logs</a></td></tr>
                  </table>

                  <br>
                  <p>🚀 <b>Great job!</b> Your Jenkins auto-trigger pipeline is working perfectly.</p>
                </body>
                </html>
                """
            )
        }

        failure {
            emailext(
                to: 'bibekkumarsahu2011@gmail.com',
                subject: "❌ FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                mimeType: 'text/html',
                body: """
                <html>
                <body style="font-family: Arial, sans-serif;">
                  <h2 style="color: red;">❌ Jenkins Build Failed</h2>

                  <table border="1" cellpadding="8" cellspacing="0" style="border-collapse: collapse;">
                    <tr><td><b>Project</b></td><td>${env.JOB_NAME}</td></tr>
                    <tr><td><b>Build Number</b></td><td>${env.BUILD_NUMBER}</td></tr>
                    <tr><td><b>Status</b></td><td style="color: red;">FAILED</td></tr>
                    <tr><td><b>Build URL</b></td>
                        <td><a href="${env.BUILD_URL}">Open Build</a></td></tr>
                    <tr><td><b>Console Output</b></td>
                        <td><a href="${env.BUILD_URL}console">View Logs</a></td></tr>
                  </table>

                  <br>
                  <p>⚠ Please check the logs and fix the issue.</p>
                </body>
                </html>
                """
            )
        }
    }
}
