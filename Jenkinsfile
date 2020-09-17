pipeline {
    agent any

    environment {
        dockerImage = ''
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build("podto/myweb")
                }
            }
        }
        stage('Push image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: '4ef0701d-6141-4a9d-87cf-47b228a17e6f', url: 'https://index.docker.io/v1/') {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deployment') {
            steps {
                //sh 'kubectl apply -f deployment.yml';
                
                withKubeConfig(caCertificate: 'certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJd01EZ3lPREE0TURNeU5sb1hEVE13TURneU5qQTRNRE15Tmxvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBS3IzClRiSDFVRGd5SDhHb3lSVWRiWjlxSGZBK0daMnhaRzhWaFUyaVVTb2tGVGhHRERJTEt4c01ZRVJWam9mbWFsVVEKeGtCNXd4WVRaZEhhd0UyeHhaZjJ1UHF4NmJmcFU2MGJEYUl1OWN2ckpyMEViWUoxRUowWW5jQlZIaDVYNEtQbApmRzc4MHNxSXVlUVJpZisvY0ZrVTZYaTcxYlliS1FNeU1oTWdYcHAvQlJWZDdNMmZ4QjZjNUtGbHBQV3RHdVBkCm16UGtSSXJ1N2ZVRkc2NUxUWFdsZmpNY3RUUjhTTElTUmlHTTh5MnBRa2hCSkxyVGhHOERvY0ZLYnpVS2UydVAKSGV5RGwwUG80bGl2TEE3NnBRVzRLejFuN0F2bldSbWtxQVJia093WEh1N1F0bkhuT2U3TjAvaVpDWlNqSFk2cApxc3lWMWxRbEk0clQzdGtndEo4Q0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFLZWpCQW0vbklqb1lId3EwakRrbXlqc2R4YXkKcng1OUpydjhNVVhYU25rNE9WQTB6Nmh4KzkrMUcyaFRiNEQybHUydDNibWdVdGN6KzM3STMyNi9NZWdtWGVqYwpoQ1hBMmEyNVZmNE94dFJDQWhVNkd4Mld5WldKdjRFU001c1AzSUwyRTdoSE1Uc2h3VE9QT0ZBYWFUb1Vsc0EvCkY0aHBwc2dzRENjSGpiNEt5KzJSaWc1N3JTL2tFeE9MSzJrZDZneFE4MjlaRzQxQ05sY2N6TVRWbjlUbzA2Ti8KR1l4RVJJUkl1Zm9FQlFXaEN6cW9sRlZPQWhoWjNzS0h3amZ0eUFoazE5NEJna0kybm9tUnBkdlhXSFZsTWxrKwpDMVpjcHVRNlZFQVBseVcyaEh6TU5ZakszQWd4cjZoZGU2RytTOE9EaE0zdkJrZGRnRnNoaDJMT245WT0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=', clusterName: 'k8s-2', contextName: 'kubernetes-admin@k8s-2', credentialsId: 'kubeconfig2', namespace: 'ball', serverUrl: 'https://gateway.ezmeral.yipintsoigroup.com:10000') {
    				//sh 'kubectl apply -f deployment.yml';
    				sh 'kubectl config view'
				}

            }
        }
    }
}