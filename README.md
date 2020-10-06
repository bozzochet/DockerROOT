## studenti
To host the Dockefile for a container with ROOT, compiler, emacs, ...

The code on GitHub (https://github.com/bozzochet/studenti) is then connected to DockerHub (https://github.com/bozzochet/studenti) and the build is automatical at every push. The idea is to take the Docker image and run directly from DockerHub without looking at the GitHub code.

The Docker will be built starting from the ufficial ROOT Docker: https://hub.docker.com/r/rootproject/root and the README of that DockerHub image is quite helpful (part of it is replicated here).

### Supported tags
* latest

### Supported C++ standards
Tag 'latest' (the default tag) comes with ROOT compiled with C++11 support.

### To build (if taking the image from DockerHub you **don't need** to do this):
```
$ docker build --tag bozzochet/studenti:latest .
```

### To run the container:
```
docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:/home/studente/current_dir -e DISPLAY=$ip:0 bozzochet/studenti:latest /bin/bash
```
and this will:
* export the display (look at https://github.com/bozzochet/studenti and its source, https://hub.docker.com/r/rootproject/root, for more explanations on this);
* export the current dir (i.e. `pwd`) to the container 'current_dir' inside the user (i.e. 'studente') home. This is quite usefull and makes the bash and ROOT history persistent;
* open a bash session. If running without the last argument a ROOT CINT (in batch mode) session will be opened. This argument can be substituted with another command, for example `root` to start a ROOT CINT (graphical) session.

