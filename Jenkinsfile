def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
  containerTemplate(name: 'python', image: 'python:3.7', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', command: 'cat', ttyEnabled: true)
],
volumes: [
//  hostPathVolume(mountPath: '/home/gradle/.gradle', hostPath: '/tmp/jenkins/.gradle'),
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
]) {
  node(label) {

    stage (' Cloning the project ') {
        script {
          sh """
                git clone https://github.com/yampeled1/simple-web-app.git
                cd simple-web-app && echo `git rev-parse --short HEAD` > commit-hash  
             """
        }
    }
    stage('Testing') {
        container('python') {
          sh """
            pip install -r simple-web-app/requirements.txt
            python simple-web-app/test_app.py
            """
        }
    
  }
    stage('Create Docker images') {
        container('docker') {
          sh """
            docker build simple-web-app --tag trow.kube-public:31000/web-app:`cat simple-web-app/commit-hash`
            docker push trow.kube-public:31000/web-app:`cat simple-web-app/commit-hash`
            """
        }
    
  }
}

}
