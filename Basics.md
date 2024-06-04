### Learnings about Docker 
* Runtime--> start and stop containers, runc, containerd

* Engine--> Daemon, Restapi, Dockercli Client server architecture.

* Docker image --> receipe
* instructions with source code
* cotainer is an running instance of an image

* Dockerfile-->image-->Container
* you run image to make a container

* images are in layer, immutable file

* docker file from base image:
    from ubuntu
    maintainer
    run apt-get update
    cmd "echo", "hello world"
    docker build -t myimage:1.01 .(filepath)

* client--> daemon-->grpc-->(containerd--> shim--> runc)

* Docker-Compose for running multiple containers.

* Docker-compose up

* yaml files has less clutter than json files.

Docker-compose file Example:
----
version: "3.8"

services:
  client:
    build: ./frontend
    ports:
      - 3000:3000

  api:
    build: ./backend
    ports:
      - 3001:3001
    environment:
      DB_URL: mongodb://db/appname

  db:
    image: mongo:4.0-xenial
    ports:
      - 27017:27017
    volumes:
      - app:/data/db

volumes:
  app:

----

* Docker-compose build
* Docker-compose up
* Docker-compose down

* 3 networks bridge host none
* dns resolver