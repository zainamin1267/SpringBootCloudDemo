docker build -t demo-app:latest ./

docker image ls | grep 'demo-app

docker tag demo-app:latest zainamin22/demo-app:latest 

docker push zainamin22/demo-app:latest 

helm template demo-app ./helm/app-chart > output.yaml

helm install demo-app -n dev ./helm/app-chart
