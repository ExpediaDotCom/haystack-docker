- [Running Haystack using docker-compose](#running-haystack-using-docker-compose)
  * [Allocate memory to docker](#allocate-memory-to-docker)
  * [To start Haystack's traces, trends and service graph](#to-start-haystacks-traces-trends-and-service-graph)
  * [To start Zipkin (tracing) with Haystack's trends and service graph](#to-start-zipkin-tracing-with-haystacks-trends-and-service-graph)
  * [Note on composing components](#note-on-composing-components)

## Running Haystack using docker-compose

### Allocate memory to docker

Please check this [Stackoverflow answer](https://stackoverflow.com/questions/44533319/how-to-assign-more-memory-to-docker-container) 

To run all of haystack and its components, __it is suggested to change the default in docker settings from `2GiB` to `4GiB`__

### To start Haystack's traces, trends and service graph

```
docker-compose -f docker-compose.yml \
               -f traces/docker-compose.yml \
               -f trends/docker-compose.yml \
               -f service-graph/docker-compose.yml \
               -f agent/docker-compose.yml up
```

The command above starts haystack components and also two sample web applications and haystack-agent.  Give a minute or two for the containers to come up and connect with each other. 

Haystack's UI will be available at http://localhost:8080 

[Sample application](https://github.com/ExpediaDotCom/opentracing-spring-haystack-example) has a 'frontend' and 'backend'. The 'frontend' app will be available in at http://localhost:9090/hello. Sending a request to frontend will cause a call to the backend before fulfilling this request. 

Send some sample requests to the 'frontend' application by running 

```bash
run.sh
```

One can then see the traces, trends and a service-graph showing the relationship between the two applications in the UI.

### To start Zipkin (tracing) with Haystack's trends and service graph

```
docker-compose -f docker-compose.yml \
               -f zipkin/docker-compose.yml \
               -f trends/docker-compose.yml \
               -f service-graph/docker-compose.yml up
```

The command above starts [Pitchfork](https://github.com/HotelsDotCom/pitchfork) to proxy data to [Zipkin](https://github.com/openzipkin/) and Haystack. 

Give a minute or two for the containers to come up and connect with each other.  Once the stack is up, one can use the sample application @ https://github.com/openzipkin/brave-webmvc-example and send some sample data to see traces (from Zipkin), trends and service-graph in haystack-ui @ http://localhost:8080


### Note on composing components

Note the two commands above add a series of `docker-compose.yml` files. 

* Haystack needs at least one trace provider ( traces/docker-compose.yml or zipkin/docker-compose.yml ) and one trends provider ( trends/docker-compose.yml )
* One can remove service-graph/docker-compose.yml if `service graph` is not required
* Staring the stack just with with base docker-compose.yml, will start core services like kafka, cassandra and elastic-search along with haystack-ui with mock backend
```
docker-compose -f docker-compose.yml up
```

