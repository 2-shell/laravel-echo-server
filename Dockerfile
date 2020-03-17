FROM node:alpine

EXPOSE 6001
WORKDIR /opt/laravel-echo-server

ENV \
	ECHO_AUTH_HOST=http://localhost \
    ECHO_AUTH_ENDPOINT=/broadcasting/auth \
	ECHO_SSL_CERT_PATH= \
	ECHO_SSL_KEY_PATH= \
	ECHO_SSL_CHAIN_PATH= \
	ECHO_SSL_PASSPHRASE= \
    ECHO_PORT=6001 \
	ECHO_PROTOCOL=http \
	ECHO_REDIS_PORT=6379 \
	ECHO_REDIS_HOSTNAME=redis \
	ECHO_DEVMODE=false \
	ECHO_CLIENTS=[] \
	ECHO_ALLOW_CORS=true \
	ECHO_ALLOW_ORIGIN=http://localhost:80 \
	ECHO_ALLOW_METHODS="GET, POST" \
	ECHO_ALLOW_HEADERS="Origin, Content-Type, X-Auth-Token, X-Requested-With, Accept, Authorization, X-CSRF-TOKEN, X-Socket-Id"

RUN npm install -g laravel-echo-server

COPY files /

ENTRYPOINT ["/opt/laravel-echo-server/entrypoint.sh"]
CMD ["laravel-echo-server", "start"]
