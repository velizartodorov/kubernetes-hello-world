# kubernetes-hello-world

## Introduction

Deploying Java app "Hello World" with Kubernetes because ... why not? 🙂

## Building a Docker image with JIB 🐳

### 1. Add Gradle dependency

```shell
plugins {
  id 'com.google.cloud.tools.jib' version '3.3.2'
}
```

### 2. Build

```shell
./gradlew jibDockerBuild
```

### 3. Add following string to `build.gradle`

```shell
jib.to.image = 'hello-world-kubernetes'
```

### 4. Run and map it to port 8080

```shell
docker run -d -p8080:8080 hello-world-kubernetes
```

### 5. Open <http://localhost:8080/>