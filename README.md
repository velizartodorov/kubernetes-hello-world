# kubernetes-hello-world

## Introduction

Deploying Java app "Hello World" with Kubernetes because ... why not? 🙂

## Minikube deployment with Docker Hub

### Start service

```shell
minikube start
```

### Enable metrics server

```shell
minikube addons enable metrics-server
```

### Create namespace

```shell
kubectl create namespace default
```

Make sure you're logged out of Docker authorization, before creating the container!

### Create Docker image with JIB (make sure you're logged out of Docker!)

```shell
./gradlew jibDockerBuild
```

### Log into Docker Hub (UI/configuration file)

#### Authentication from configuration file

Make sure you log out of Docker Desktop authenticate with the `C:\Users\<USERNAME>\.docker` file:

```json
{
  "auths": {
    "https://index.docker.io/v1/": {
      "auth": "USERNAME_BASE64:PASSWORD_BASE64"
    }
  },
  "credsStore": "wincred"
}
```

to encrypt your username and password in BASE64, running following command in command line:

```shell
echo -n "yourusername:yourpassword" | base64
```

### Create the Docker container

`USER_ID` equals to your username in Docker Hub

```shell
docker tag hello-world-kubernetes:latest USER_ID/hello-world-kubernetes:latest
```

### Push the Docker container

```shell
docker push USER_ID/hello-world-kubernetes:latest
```

#### Authentication from Docker Hub website (Windows)

### Create manifest file for deployment

```bash
kubectl create deployment default --image=USER_ID/hello-world-kubernetes:latest --dry-run=client -o=yaml > deployment.yml
```

### Create service file

```shell
kubectl create service clusterip default --tcp=8080:8080 --dry-run=client -o=yaml > service.yml
```

### Apply `service.yml` file

```shell
kubectl apply -f service.yml
```

### Apply `deployment.yml` file

```shell
kubectl apply -f deployment.yml
```

### Get all pods in `default` namespace

```shell
kubectl get all -n default
```

### Port forwarding the service

```shell
kubectl port-forward service/default 8080:8080 -n default
```

### Make a CURL request to the URL

```shell
curl http://localhost:8080/
```
