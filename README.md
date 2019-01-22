## Running Haystack Trace subsystem 

```
$docker-compose -f docker-compose.yml up
```

The above command will start core services and ui with mock backend services. 

To start with traces subsystem 

```
$docker-compose -f docker-compose.yml -f traces/docker-compose.yml up
```

**NOTE : Image used for 
* `haystack-ui`
* `haystack-trace-indexer` and 
* `haystack-trace-backend-cassandra` 

are locally built - waiting for a merge to master/release for some of the fixes to go in**
