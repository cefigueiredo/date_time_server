# DateTimeServer

App to listen for requests on ports TCP and UDP and respond with the current date formatted as iso8601.

On both UDP and TCP the accepted requests are:
- `date`
- `time`
- `datetime`

The app uses the same port number for both UDP and TCP connections.
The bash executable accepts a PORT as an argument but if not provided, the port binded will be 3000/TCP and 3000/UDP

## To test TCP connections:
```
$> telnet localhost 3000
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
date
2020-06-01
Connection closed by foreign host.
```

## Dependencies

- Elixir ~> 1.10

## Installation and Initialization

```
brew install elixir
mix install


./date_time_server.sh [PORT] 
```


