//pipeline {
//    agent any
//
//    tools {
//        flutter 'flutter-sdk'
//    }
//
//    stages {
//        stage('Checkout') {
//            steps {
//                git branch: 'main', url: 'https://github.com/mostafa407/flutterInfoFilm.git'
//            }
//        }
//
//        stage('Dependencies') {
//            steps {
//                sh 'flutter pub get'
//            }
//        }
//
//        stage('Analyze') {
//            steps {
//                sh 'flutter analyze'
//            }
//        }
//
//        stage('Test') {
//            steps {
//                sh 'flutter test'
//            }
//        }
//
//        stage('Build APK') {
//            steps {
//                sh 'flutter build apk --release'
//            }
//        }
//
//        stage('Archive Artifact') {
//            steps {
//                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', fingerprint: true
//            }
//        }
//        stage('Archive APK') {
//            steps {
//                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-release.apk', fingerprint: true
//    }
//}
//
//    }
//}
pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
                echo 'Hello from Jenkins!'
            }
        }
    }
}
