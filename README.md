## studenti
To host the Dockefile for a container with ROOT, compiler, emacs, ...

This is connected to DockerHub (https://github.com/bozzochet/studenti) and the build is automatical at every push. The idea is to take the Docker image and run directly from DockerHub without looking at this code.

The Docker will be built starting from the ufficial ROOT Docker: https://hub.docker.com/r/rootproject/root 

### To build something like:
```
$ docker build --tag bozzochet/studenti:latest .
```

### To run the container:
```
docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:/home/studente/current_dir -e DISPLAY=$ip:0 bozzochet/studenti:latest /bin/bash
```
and this will:
* export the display (look at https://github.com/bozzochet/studenti and itss source, https://hub.docker.com/r/rootproject/root, for more explanations om this)
* export the current dir (i.e. `pwd`) to the container 'current_dir' inside the user (i.e. 'studente') home. This is quite usefull and makes the bash and ROOT history persistent
* open a bash session. If running without the last argument a ROOT CINT (in batch mode) session will be opened. This argument can be substituted with another command: for example `root` to start a ROOT CINT (graphical) session

