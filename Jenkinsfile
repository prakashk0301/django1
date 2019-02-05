#!groovy

node {

    try {
        stage 'Checkout'
            checkout scm

            sh 'git log HEAD^..HEAD --pretty="%h %an - %s" > GIT_CHANGES'
            def lastChanges = readFile('GIT_CHANGES')
            message: "Started `${env.JOB_NAME}#${env.BUILD_NUMBER}`\n\n_The changes:_\n${lastChanges}"

        stage 'Test'
            sh 'virtualenv env -p python3.7'
            sh '. env/bin/activate'
            sh 'env/bin/pip install -r requirements.txt '
            sh 'env/bin/python3.7 manage.py'
//            sh 'python manage.py runserver 0.0.0.0:8000

        stage 'Deploy'
            sh 'chmod +x deployment/deploy_prod.sh'
            sh 'ssh root@18.184.1.78 -yes'
            sh 'cd project1'
            sh 'git pull'
            sh 'source /opt/envs/project1/bin/activate'
            sh 'pip install -r requirements.txt'
            sh '#./manage.py migrate'
            sh 'sudo supervisorctl restart project1'
            sh 'exit'
//                EOF
        
 //           sh './deployment/deploy_prod.sh'

//        stage 'Publish results'
//            slackSend color: "good", message: "Build successful: `${env.JOB_NAME}#${env.BUILD_NUMBER}` <${env.BUILD_URL}|Open in Jenkins>"
    }

    catch (err) {
        message: "Build failed :face_with_head_bandage: \n`${env.JOB_NAME}#${env.BUILD_NUMBER}` <${env.BUILD_URL}|Open in Jenkins>"

        throw err
    }

}
