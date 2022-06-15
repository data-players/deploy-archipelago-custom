# deploye-archipelago-custom

If you need a total custom archipelago with modification, this is the good place to be.
However, if you only want a classic archipelago and change only the title and colors, use this repos https://github.com/data-players/deploy-archipelago-classic

### introduction

First make sur you get docker and docker-compose install on your server
Make sure you have an usable domain name, then create 2 sub-domain for middleware and frontend (Exemple data.myDomain.com and myDomain.com)
Of course you need a server working with linux and get acess it. (ssh is one the way)

### 1 Fork archipelago and clone this repos on your server

First you have to fork archipelago on your own repos. To do it, just go to https://github.com/assemblee-virtuelle/archipelago and click fork (Up right). then select your git account and fork.
Now you can git clone your new archipelago forked on your linux server.

Newt stape, you have to clone the deploy-archipelago-custom reppos from this address : https://github.com/data-players/deploy-archipelago-custom

Now you have two directory next to each other on your server : "your-forked-archipelago" and deploy-archipelago-custom

### 2 Archipelago custom

It is better to custom your own archipelago localy.
So check the archipelago's readme and set up your local environement (there is a quick tutorial) 
Create your dream archipelago, test it and push it to git !

### 3 Change exemple variable

Go to the deploy-archipelago-customdirectory.
Some variables in the docker-compose file are default values. You need to replace them with yours to make it works.
- line 19 myEmail@myemail.fr
- line 40 MyFusekiPassword
- line 57 MyJenaPassword
- line 58 https://data.myDomain.com/ middleware URL
- line 68 data.myDomain.com (middleware domain name)
- line 82 https://data.myDomain.com/ middleware URL
- line 83 MyMapBoxToken
- line 92 myDomain.com (Your domain name)

Of course you have to set up ur domain name and sub domain name to make it works !

### 4 Try it yourself

Now go to deploy-archipelago-custom directory

Launch your app by making a 
```
docker-compose build
```

then launch your app
```
docker-compose up -d --force-recreate
```

Now it's time to check your app by going on your domain name in your faforite browser !
Grontalution !

### 5 Custom with a linked Semapps

INCOMING EARLY !

## Deploye a custom archipelago version

