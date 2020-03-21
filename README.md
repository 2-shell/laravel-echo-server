# Laravel Echo Server

## Introduction

This is a simple docker container for the [Laravel Echo Server](https://github.com/tlaverdure/laravel-echo-server).

## Configuration

The container is configured to want to use Redis by default. Most configuration can be changed by setting the appropriate environment variables. If you want a more complex config, you can mount it into the container to `/opt/laravel-echo-server/laravel-echo-server.json`.

### Environment Variables

The variables you can modify are:

#### Variables directly supported by laravel-echo-server

##### General

| Variable                         | Description                                                             |
| ---                              | ---                                                                     |
| `LARAVEL_ECHO_SERVER_AUTH_HOST`  | The host of the server that authenticates private and presence channels |
| `LARAVEL_ECHO_SERVER_PORT`       | The port for the server                                                 |
| `LARAVEL_ECHO_SERVER_DEBUG`      | Debug mode                                                              |
| `LARAVEL_ECHO_SERVER_REDIS_HOST` | Redis host                                                              |
| `LARAVEL_ECHO_SERVER_REDIS_PORT` | Redit port                                                              |

##### Running with SSL

The server supports either HTTP or HTTPS (not both simultaenously). If you want to use HTTPS, set the protocol appropriately and specify the certificate, key and any chain certificate using environment variables.

| Variable                        | Description                                         |
| ---                             | ---                                                 |
| `LARAVEL_ECHO_SERVER_PROTO`     | `http` or `https` depending on what you want to use |
| `LARAVEL_ECHO_SERVER_SSL_CERT`  | Path to an SSL certificate if using HTTPS           |
| `LARAVEL_ECHO_SERVER_SSL_KEY`   | Path to the private key for the SSL certificate     |
| `LARAVEL_ECHO_SERVER_SSL_CHAIN` | Path to a chain certificate file                    |
| `LARAVEL_ECHO_SERVER_SSL_PASS`  | The passphrase for the private key if required      |

#### Additional variables added in this image

##### General

| Variable                | Description                                       |
| ---                     | ---                                               |
| `ECHO_REDIS_KEY_PREFIX` | Redis key prefix (default: `laravel-echo-server`) |
| `ECHO_CLIENTS`          | JSON representing the clients for the server      |

##### API Access

There is a simple HTTP API built in, cross|domain access can be configured using environment variables:

| Variable             | Description                                        |
| ---                  | ---                                                |
| `ECHO_ALLOW_CORS`    | `true` or `false` if you want to allow CORS or not |
| `ECHO_ALLOW_ORIGIN`  | The allowed origin for cross-domain comms          |
| `ECHO_ALLOW_METHODS` | HTTP methods that are allowed cross-domain         |
| `ECHO_ALLOW_HEADERS` | The headers that will be accepted with CORS        |
