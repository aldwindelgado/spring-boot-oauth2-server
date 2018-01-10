Sample standalone OAuth2 authorization server for Spring Boot (Using JDBC as the CLIENT DETAILS)

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
curl -X POST -H "Authorization: Basic c2FtcGxlY2xpZW50OnNhbXBsZXBhc3N3b3Jk"  -H "Content-Type: application/x-www-form-urlencoded" -v localhost:8080/v1/oauth2/token?grant_type=client_credentials
```
#### Using JSON Format
```
curl -X POST -H "Authorization: Basic c2FtcGxlY2xpZW50OnNhbXBsZXBhc3N3b3Jk"  -H "Content-Type: application/json" -d '{ "grant_type": "client_credentials" }' -v localhost:8080/v1/oauth2/token
```

## Resource Server (JWT branch)
See [spring-boot-oauth2-client](https://github.com/aldwindelgado/spring-boot-oauth2-client/tree/jwt) for running the oauth-client (resource server)
