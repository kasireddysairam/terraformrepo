pipeline {
    agent maven

    stages {
        stage ('Compile Stage') {

            steps {
                withMaven(maven : 'Maven_3.9.5') {
                    sh 'mvn clean compile'
                }
            }
        }

        stage ('Testing Stage') {

            steps {
                withMaven(maven : 'Maven_3.9.5') {
                    sh 'mvn test'
                }
            }
        }


        stage ('Deployment Stage') {
            steps {
                withMaven(maven : 'Maven_3.9.5') {
                    sh 'mvn deploy'
                }
            }
        }
    }
}
