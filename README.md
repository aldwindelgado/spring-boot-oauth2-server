Sample standalone OAuth2 authorization server for Spring Boot

The requesting method for token supports both ```json format``` and ```url-encoded format```


The token validity is currently 60secs.


Update any of the ```clienId```/```clientPassword```/```tokenValidity``` to however you want.

## Running
```shell
mvn clean package spring-boot:run
```

## Request for a token 
Use any of the curl commands to request an access token.

#### Using URL-Encoded Format
```
curl -X POST -H "Authorization: Basic YWNjb3VudDpwYXNzd29yZA=="  -H "Content-Type: application/x-www-form-urlencoded" -v localhost:8080/oauth/token?grant_type=client_credentials
```
#### Using JSON Format
```
curl -X POST -H "Authorization: Basic YWNjb3VudDpwYXNzd29yZA=="  -H "Content-Type: application/json" -d '{ "grant_type": "client_credentials" }' -v localhost:8080/oauth/token
```

## Resource Server
See [spring-boot-oauth2-client](https://github.com/aldwindelgado/spring-boot-oauth2-client) for running the oauth-client (resource server)
