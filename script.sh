#!/bin/bash

docker build -t devcorrea/projeto-backend:1.0 backend/.
docker build -t devcorrea/projeto-database:1.0 database/.

docker push devcorrea/projeto-backend:1.0
docker push devcorrea/projeto-database:1.0

echo "criando services do kubernetes"

kubectl apply -f ./services.yml

echo "criando os deployments"

kubectl apply -f ./deployment.yml

