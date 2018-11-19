#!/bin/bash
#creating cicd project
#creating dev and
oc new-project dev --description="DEV" --display-name="DEV"
oc new-project stage --description="STAGE fo" --display-name="STAGE"
oc new-project cicd --description="CICD" --display-name="CICD"

oc new-app -f ./gogs-openshift/gogs-template.yaml --param
oc new-app -f ./nexus-openshift/nexus-template.yaml
oc new-app -f ./sonarqube-openshift/sonarqube-postgresql-template.yaml --param=SONARQUBE_VERSION=6.7
oc new-app -f ./jenkins-openshift/jenkins-template.yaml

#switch to cicd project
oc project cicd

# Grant Jenkins Access to Projects
oc policy add-role-to-group edit system:serviceaccounts:cicd -n dev
oc policy add-role-to-group edit system:serviceaccounts:cicd -n stage


oc new-app -f ./jenkins-openshift/jenkins-pipeline-template.yaml -n cicd

