## Running Haystack using docker-compose

### Allocate memory to docker

Please check this [Stackoverflow answer](https://stackoverflow.com/questions/44533319/how-to-assign-more-memory-to-docker-container) 

To run all of haystack and its components, **it is suggested to change the default in docker settings from `2GiB` to `4GiB`**


### To start core services and haystack-ui with mock data

```
$docker-compose -f docker-compose.yml up
```

Core services started by the command above are  Kafka, Cassandra and Elastic search along with haystack-ui

### To start with core services and traces subsystem 

```
$docker-compose -f docker-compose.yml -f traces/docker-compose.yml up
```

Note: This will start configure `trends` to work with mock data

### To start with core services and traces subsystem 

```
$docker-compose -f docker-compose.yml -f trends/docker-compose.yml up
```

NoteL This will start configure `trends` to work with mock data

### To start traces and trends

```
$docker-compose -f docker-compose.yml -f traces/docker-compose.yml -f trends/docker-compose.yml -f agent/docker-compose.yml up
```

Give a minute or two for the containers to come up and connect with each other. The command above starts haystack-agent as well. 

Finally, one can find a sample spring boot application with configuration to send data to haystack agent @  https://github.com/mchandramouli/haystack-springbootsample

