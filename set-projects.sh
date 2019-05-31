oc new-project demo-dev
oc new-project demo-build
oc new-project demo-test
oc new-project demo-prod

#build JENKINS app

oc new-app -n demo-build --template=jenkins-persistent --name=jenkins -p MEMORY_LIMIT=1Gi

oc process -f setup/all-in-one-template.yaml TEST_ROUTE_HOSTNAME=demo-test.ge-apps.openhybridcloud.io PROD_ROUTE_HOSTNAME=demo-prod.ge-apps.openhybridcloud.io > objects.json

oc apply -f objects.json

oc adm policy add-role-to-user admin system:serviceaccount:demo-build:jenkins -n demo-test
oc adm policy add-role-to-user admin system:serviceaccount:demo-build:jenkins -n demo-prod



