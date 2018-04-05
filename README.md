# kong-forward-proxy

A Kong plugin that allows access to an upstream url through a forward proxy (eg. squid).

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

## Configuration
Add this plugin globally or attached to an API.
Calls to the API's upstream URL will be proxied through the specify proxy host and port

```bash
$ curl -X POST http://kong:8001/apis/{api}/plugins \
    --data "name=forward-proxy" \
    --data "config.proxy_host=proxy.mycorp.org" \
    --data "config.proxy_port=8080"
```

## Limitation
Untested behaviors include:
- HTTPS proxy
- Load Balancing
