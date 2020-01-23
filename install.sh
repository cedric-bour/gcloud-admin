gcloud container clusters create cluster-app1-prod --num-nodes=3 -m g1-small
gcloud container clusters get-credentials cluster-app1-prod
sh ./deployment.sh apply app1-prod eu.gcr.io/app1-265921/image-app1-prod 80 2
sh ./service.sh apply app1-prod 80
sh ./cert.sh apply app1-prod gcloudp.cedric-bour.fr
sh ./ingress.sh apply app1-prod 80

gcloud container clusters create cluster-app1-dev --num-nodes=3 -m g1-small
gcloud container clusters get-credentials cluster-app1-dev
sh ./deployment.sh apply app1-dev eu.gcr.io/app1-265921/image-app1-dev 80 2
sh ./service.sh apply app1-dev 80
sh ./cert.sh apply app1-dev gcloudd.cedric-bour.fr
sh ./ingress.sh apply app1-dev 80

