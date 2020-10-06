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
[Adapted from https://hub.docker.com/r/rootproject/root] In order to run containers, you must have Docker installed and, once, you need to execute
```
docker pull bozzochet/studenti
```
Then you can start a container by running the following command in your terminal which will start the latest stable release of ROOT:
```docker run --rm -it rootproject/root
```
Note that the `--rm` flag tells Docker to remove the container, together with its data, once it is shut down. In order to persist data, it is recommended to mount a directory on the container. For example, to mount your home directory on Linux and Mac, run:
```docker run --rm -it -v ~:/userhome --user $(id -u) rootproject/root
```
On Windows, you have to specify the full path to your user directory: docker run --rm -it -v C:\\Users\\Username:/userhome rootproject/root
```
docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:/home/studente/current_dir -e DISPLAY=$ip:0 bozzochet/studenti:latest /bin/bash
```
and this will:
* export the display (look at https://github.com/bozzochet/studenti and its source, https://hub.docker.com/r/rootproject/root, for more explanations on this);
* export the current dir (i.e. `pwd`) to the container 'current_dir' inside the user (i.e. 'studente') home. This is quite usefull and makes the bash and ROOT history persistent;
* open a bash session. If running without the last argument a ROOT CINT (in batch mode) session will be opened. This argument can be substituted with another command, for example `root` to start a ROOT CINT (graphical) session.

