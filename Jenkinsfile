pipeline {
  agent any
  stages {
    stage('Clone repo') {
      steps {
        git(url: 'https://github.com/yampeled1/simple-web-app.git', branch: 'master')
      }
    }

    stage('Test') {
      steps {
        sh 'echo "Running unitest"'
      }
    }

    stage('Build image') {
      steps {
        sh 'image_tag=`git rev-parse --short HEAD`; docker build . -t x:$image_tag'
      }
    }

    stage('Push image') {
      steps {
        sh 'image_tag=`git rev-parse --short HEAD`; docker push . -t x:$image_tag'
      }
    }

  }
}