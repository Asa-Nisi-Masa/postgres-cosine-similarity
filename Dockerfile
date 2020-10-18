FROM postgres:12

RUN apt-get update && apt-get install -y cmake postgresql-server-dev-12

COPY . /
RUN make && make install
