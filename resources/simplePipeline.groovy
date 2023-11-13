properties([pipelineTriggers([githubPush()])])

node {
        git url: 'https://github.com/bmajczak/app.git',branch: 'main'
        stage ('Compile Stage') {

            echo "compiling"
            echo "compilation completed"
        }

        stage ('Testing Stage') {

            echo "testing completed"
            echo "testing completed"
        }
        stage("Deploy") {

                echo "deployment completed"
        }
}
