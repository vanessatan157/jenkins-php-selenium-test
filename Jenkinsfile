pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                bat '''
                @echo off
                rem Deploy PHP application to web server directory
                xcopy /s /i /y c:\\wee\\jenkins-php-selenium-test\\jenkins-php-selenium-test\\src c:\\path\\to\\webserver\\wwwroot
                rem Start or restart the web server if needed
                net stop wampapache64
                net start wampapache64
                '''
                input message: 'Finished using the website? (Click "Proceed" to continue)'
                bat '''
                @echo off
                rem Optionally stop the web server
                net stop wampapache64
                '''
            }
        }
        stage('Headless Browser Test') {
            agent any
            environment {
                MAVEN_HOME = 'D:\\apache-maven-3.9.8'
                PATH = "${MAVEN_HOME}\\bin;${env.PATH}"
            }
            steps {
                bat 'mvn -B -DskipTests clean package'
                bat 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
    }
}

