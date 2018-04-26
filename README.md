# kong-forward-proxy

A Kong plugin that allows access to an upstream url through a forward proxy (eg. squid).

![---](kong-forward-proxy.png?raw=true)

## Configuration
Add this plugin globally or attached to an API.
All calls to the API's upstream URL will then be proxied through the specify proxy host and port.

```bash
$ curl -X POST http://kong:8001/apis/{api}/plugins \
    --data "name=forward-proxy" \
    --data "config.proxy_host=proxy.mycorp.org" \
    --data "config.proxy_port=8080"
```

## Installation

Clone the repository, navigate to the root folder and run:
```
make install
```

Edit your ```kong.yaml``` to include the plugin like so:
```yaml
custom_plugins:
  - forward-proxy
```

Restart Kong.

## Test with Docker

A sample docker-compose is included for testing purpose.
Running it will spin-up a Cassandra database and Kong instance with the plugin installed and activated.

Clone the repository, navigate to the root folder and run:
```bash
$ docker-compose up
```
Wait for the startup and migration of the database to complete and access check plugin availability:
```bash
$ curl -X POST http://localhost:8001
```
```javascript
{
  "plugins": {
    "enabled_in_cluster": [],
    "available_on_server": {
      // ...
      "forward-proxy": true,
      // ...
    }
  }
  // ...
}
```

## Limitation
Untested behaviors include:
- HTTPS forward proxy
- Upstream load balancing
