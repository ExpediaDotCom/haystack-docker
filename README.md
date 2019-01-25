## Running Haystack Trace subsystem 

```
$docker-compose -f docker-compose.yml up
```

The above command will start core services and ui with mock backend services. 

To start with traces subsystem 

```
$docker-compose -f docker-compose.yml -f traces/docker-compose.yml up
```

To start with trends subsystem 

```
$docker-compose -f docker-compose.yml -f trends/docker-compose.yml up
```

To start traces and trends


```
$docker-compose -f docker-compose.yml -f traces/docker-compose.yml -f trends/docker-compose.yml up
```
