FROM node:alpine

EXPOSE 6001
WORKDIR /opt/laravel-echo-server

ENV \
	ECHO_CLIENTS=[] \
	ECHO_ALLOW_CORS=true \
	ECHO_ALLOW_ORIGIN=http://localhost:80 \
	ECHO_ALLOW_METHODS="GET, POST" \
	ECHO_ALLOW_HEADERS="Origin, Content-Type, X-Auth-Token, X-Requested-With, Accept, Authorization, X-CSRF-TOKEN, X-Socket-Id"

RUN npm install -g laravel-echo-server

COPY files /

ENTRYPOINT ["/opt/laravel-echo-server/entrypoint.sh"]
CMD ["laravel-echo-server", "start"]
