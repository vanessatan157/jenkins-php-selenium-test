pipeline {
    agent none
    stages {
        stage('Integration UI Test') {
            parallel {
                stage('Deploy') {
                    agent any
                    steps {
                        bat 'jenkins\\scripts\\deploy.bat'
                        input message: 'Finished using the website? (Click "Proceed" to continue)'
                        bat 'jenkins\\scripts\\kill.bat'
                    }
                }
                stage('Headless Browser Test') {
                    agent {
                        docker {
                            image 'maven:3-adoptopenjdk-11' // Using AdoptOpenJDK 11 instead of Alpine
                            args '-v C:\\Users\\h20ch\\.m2:/root/.m2' // Adjust path accordingly
                        }
                    }
                    environment {
                        PATH = "${tool 'Maven'}/bin:${env.PATH}" // Adjust Maven tool name if needed
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
    }
}

