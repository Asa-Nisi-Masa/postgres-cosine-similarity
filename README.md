# postgres-cosine-similarity

PostgreSQL extension for finding cosine similarity between two vectors (arrays)

## Instructions

### Installation

Run 
```
make
sudo make install
```

### Usage

```
postgres=# CREATE EXTENSION cosine_sim;
CREATE EXTENSION

postgres=# SELECT cosine_sim(ARRAY[1,2,3], ARRAY[1,2,3]);
 cosine_sim 
------------
          1
(1 row)

postgres=# SELECT cosine_sim(ARRAY[1,2,3], ARRAY[4, 5, 6]);
 cosine_sim 
------------
 0.97463185
(1 row)
```

## Docker

Remove binaries if you've built/installed the extension locally (so they don't get copied to the container):

```
rm cosine_sim.so cosine_sim.o cosine_sim.bc
```

Build the image and enter the container

```
docker build . -t similarity
docker run -it --entrypoint bash --user postgres similarity
```

while inside the container run

```
pg_createcluster 12 main
pg_ctlcluster 12 main start
```

Use the extension

```
psql -c "CREATE EXTENSION cosine_sim; SELECT cosine_sim(ARRAY[1,2], ARRAY[1, 1.9]);"
```