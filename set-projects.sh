oc new-project demo-dev
oc new-project demo-build
oc new-project demo-test
oc new-project demo-prod

#build JENKINS app

oc new-app -n demo-build --template=jenkins-persistent --name=jenkins -p MEMORY_LIMIT=1Gi

oc process -f setup/all-in-one-template.yaml TEST_ROUTE_HOSTNAME=demo-test.192.168.64.3.nip.io PROD_ROUTE_HOSTNAME=ddemo-prod.192.168.64.3.nip.io > objects.json

oc apply -f objects.json


