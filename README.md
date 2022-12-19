# deploy-archipelago-custom

If you need a total custom archipelago with modification, this is the good place to be.

However, if you only want a classic archipelago and make only little modifications, use this repos https://github.com/data-players/deploy-archipelago-classic. The readme of this repocontains useful additional technicals informations.

### introduction

First make sur you get docker, docker-compose and git install on your linux server.
Make sure you have an usable domain name, then create 3 sub-domain :
- middleware (Exemple : data.myDomain.com)
- frontend (Exemple : myDomain.com)
- authentification (Exemple login.myDomain.com)(optional if you use sso and want domain login with same root than your app)

### 1 Fork archipelago and clone this repos on your server

First you have to fork archipelago on your own repos. To do it, just go to https://github.com/assemblee-virtuelle/archipelago and click fork (Up right). then select your git account and fork.
Now you can git clone your new archipelago forked on your linux server.

Next stape, you have to fork the deploy-archipelago-custom repos from this address : https://github.com/data-players/deploy-archipelago-custom and clone it newt to your archipelago directory.

Now you have two directory next to each other on your server : "your-forked-archipelago" and deploy-archipelago-custom

### 2 local test and custom

To customize your own instance, it is preferable to work locally. So use the docker-compose-dev
```
make start-local
```
Frontend on http://localhost:4000/
Middleware on http://localhost:3000/
Fuseki database on http://localhost:3030 (user: admin, password : admin)
keycloak on http://localhost:8080 (Keycloak is a custom OIDC)
You will get an error when creating some organisation :
```
index.js:209 Error: @semapps/geo-components : No access token in mapbox configuration
```
This is because MapBox Access Token is not define in the docker-compose file. This is not really a problem for local testing.
But you will need it to develop and test all the features (Obtain an access token : https://docs.mapbox.com/help/getting-started/access-tokens/).

Now you can work on your customisation.

## 3 Deploying on internet

Some variables in the docker-compose file are default values. You need to replace them with yours to make it works.
- line 18 myEmail@myemail.fr
- line 39 MyJenaPassword
- line 58 MyJenaPassword
- line 59 https://data.myDomain.com/ (middleware URL)
- line 68 data.myDomain.com (middleware domain name)
- line 77 https://data.myDomain.com/ (middleware URL)
- line 78 MyMapBoxToken (obtain an access token : https://docs.mapbox.com/help/getting-started/access-tokens/)
- line 89 myDomain.com (Your domain name)
- line 97 myKeycloakPassword (To access OIDC amdin page)
- line 99 https://login.myDomain.com/auth (Login URL)
- line 116 login.mydomain.com (Login domain name)

Of course you have to set up your domain name and sub domain name in your domain provider to make it works !

## 4 Launch your archipelago

Launch your app by making a 

```
make start-prod
```

If you need to force dockers to restart add : --force-recreate

Check in your favorite browser if it's work.

Before testing your new app, you must configurate your OIDC to autorize connexion from your domain name "data" (See environement variable line 67 above).
Go to https://login.mydomain.com/auth and click on administration console. Connect with admin and "myKeycloakPassword".
On the left panel, click on Clients, then semapps as client ID.
If you scroll down, you must see a line "Valid Redirect URIs. Add your middleware address + "/*" (exemple : https://data.mydomain.com/*)

## 5 DEploying modifications

Pull your modification on your server then :
```
make start-prod
```

## 6 Custom with a linked Semapps

If you need to use a local semapps to work on instead of npm package, you can use the docker-compose-link.yaml file.
Before this, you need to git clone https://github.com/assemblee-virtuelle/semapps next to the two others directories.

```
docker-compose -f docker-compose-link.yaml up -d
```

## 7 Other

### ecosystem.config.js

You can easily custom your own ecosystem.config by editing the one in ./deploy/middleware/app/
