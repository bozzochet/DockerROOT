FROM rootproject/root:latest

LABEL maintainer.name="Matteo Duranti"
LABEL maintainer.email="matteo.duranti@infn.it"

ENV LANG=C.UTF-8

COPY packages_custom packages_custom

RUN apt-get update -qq \
 && apt-get -y install $(cat packages_custom) \
 && rm -rf /var/lib/apt/lists/*

CMD ["root", "-b"]
