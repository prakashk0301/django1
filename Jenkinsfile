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
            sh 'env/bin/pip install -r requirements.txt'
	    sh 'env/bin/python3.7 manage.py test --testrunner=project1.tests.test_runners.NoDbTestRunner'
 //           sh 'env/bin/python3.7 manage.py'
//            sh 'python manage.py runserver 0.0.0.0:8000

        stage 'Deploy'
	    sh 'chmod a+x deployment/DevOps-key.pem'
	    sh 'ssh -o StrictHostKeyChecking=no -tt -i /home/ec2-user/.ssh/DevOps-key.pem ec2-user@54.93.67.232'
//	     sh 'ssh -o StrictHostKeyChecking=no IdentityFile /.ssh/DevOps.pem ec2-user@54.93.67.232'    
//	    sh 'ssh -o StrictHostKeyChecking=no ec2-user@54.93.67.232'
//            sh 'chmod a+x deployment/deploy_prod.sh'     
//            sh './deployment/deploy_prod.sh'

//        stage 'Publish results'
//            slackSend color: "good", message: "Build successful: `${env.JOB_NAME}#${env.BUILD_NUMBER}` <${env.BUILD_URL}|Open in Jenkins>"
    }

    catch (err) {
        message: "Build failed :face_with_head_bandage: \n`${env.JOB_NAME}#${env.BUILD_NUMBER}` <${env.BUILD_URL}|Open in Jenkins>"

        throw err
    }

}
