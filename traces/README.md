## Running Haystack Trace subsystem 

```
$docker-compose -f docker-compose.yml up
```

The above command will start with an in-memory backend. To start with cassandra as a backend store, run the command

```
$docker-compose -f docker-compose.yml -f docker-compose-cassandra.yml up
```

**NOTE : Image used for `haystack-trace-indexer` and `haystack-trace-backend-cassandra` are locally built - waiting for a merge to master/release for some of the fixes to go in**
