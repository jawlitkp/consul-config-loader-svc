podTemplate(
    label: 'mypod', 
    inheritFrom: 'default',
    containers: [
        containerTemplate(
            name: 'base', 
            image: 'jawlitkp/builder-base:v1.0.0',
            ttyEnabled: true,
            command: 'cat'
        )
    ],
    volumes: [
        hostPathVolume(
            hostPath: '/var/run/docker.sock',
            mountPath: '/var/run/docker.sock'
        )
    ]
) 
{
    node('mypod') {
        stage ('Deploy') {
            container ('base') {
                sh "git clone https://github.com/jawlitkp/consul-config-loader-svc.git"
                sh "ls -la"
                sh "./consul-config-loader-svc/install.sh"
            }
        }
    }
}

