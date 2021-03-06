---
title: "Node.js backend providing REST"
date:  2013-10-01T21:25:00
slug: "node-dot-js-backend-providing-rest"
aliases: [/blog/2013/10/01/node-dot-js-backend-providing-rest]
categories: ["javascript", "nodejs", "CORS", "angularjs", "RESTful"]
draft: false
---
# TL;DR
My [AngularJS demo app](https://github.com/draptik/angulardemorestful) has a new backend implementation using [node.js](http://nodejs.org/).

# ...
After some reading I decided I'll stick with node's `express` module.

OK. Here is a 'minimal' setup for a node.js server:

``` javascript app.js
var express = require('express');
var app = express();

//CORS middleware
var allowCrossDomain = function(req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type, X-XSRF-TOKEN');
  next();
};

app.use(allowCrossDomain);

/* we'll use the same port as tomcat... */
var MY_PORT = 8080; // default: 4730


/* REST API =========================================== */
var baseUrl = '/ngdemo/web';

/* GET ALL -------------------------------------------- */
app.get(baseUrl + '/users', function(req, res) {
	res.json(userRepository.getAll());
});

/* GET Dummy ------------------------------------------ */
app.get(baseUrl + '/dummy', function(req, res) {
  res.json({id: 0, firstName: 'JonFromREST', lastName: 'DoeFromREST'});
});

/* GET By Id ------------------------------------------ */
app.get(baseUrl + '/users/:id', function(req, res) {
  console.log('trying to retrieve user with id: ' + req.params.id);
  var user = userRepository.getById(req.params.id);
  res.json(user);
});


/* POST Create ---------------------------------------- */
app.post(baseUrl + '/users', function(req, res) {
  if(!req.body.hasOwnProperty('firstName') || !req.body.hasOwnProperty('lastName')) {
    res.statusCode = 400;
    return res.send('Error 400: POST syntax incorrect.');
  }

  var newUser = userRepository.addNewUser(req.body.firstName, req.body.lastName);
  res.json(newUser);
});

/* PUT (Update) --------------------------------------- */
app.put(baseUrl + '/users/:id', function (req, res) {
  if(!req.body.hasOwnProperty('id') || !req.body.hasOwnProperty('firstName') || !req.body.hasOwnProperty('lastName')) {
    res.statusCode = 400;
    return res.send('Error 400: PUT syntax incorrect.');
  }
  var changedUser = userRepository.changeUser(req.params.id, req.body.firstName, req.body.lastName);
  res.json(changedUser);
});

/* DELETE --------------------------------------------- */
app.delete(baseUrl + '/users/:id', function(req, res) {
  console.log('trying to delete user with id: ' + req.params.id);
  userRepository.deleteUser(req.params.id);
  res.json(true);
});

/* ==================================================== */

app.listen(process.env.PORT || MY_PORT);

/* Mmmhh... how can I place the code below into a seperate file and load it here? */

function User(id, firstName, lastName) {
  this.id = id;
  this.firstName = firstName;
  this.lastName = lastName;
};


function UserRepository() {

  this.users = [];

  this.createUsers = function() {
    var numberOfUsers = 10;
    for (var i = 0; i < numberOfUsers; i++) {
      var id = i + 1;
      this.users.push(new User(id, 'Foo' + id, 'Bar' + id));
    };
    return this.users;
  };

  this.getMaxUserId = function() {
    return Math.max.apply(Math, this.users.map(function(user) { 
      return user.id; 
    }));
  };

  this.getNumberOfUsers = function() {
    return this.users.length;
  };

  this.getAll = function() {
    return this.users;
  };

  this.getById = function(id) {
    var foundUser = false;
    for (var i = 0; i < this.users.length; i++) {
      var user = this.users[i];
      console.log('...checking user.id ' + user.id);
      if (user.id == id) {
        foundUser = true;
        return user;
      };
    };
    if (!foundUser) {
      console.log('Could not find user with id: ' + id);
      return 'user with id ' + id + ' not found.';
    };
  };

  this.addNewUser = function(firstName, lastName) {
    var newUser = new User(this.getMaxUserId() + 1, firstName, lastName);
    this.users.push(newUser);
    return this.getById(newUser.id);
  };

  this.changeUser = function(id, firstName, lastName) {
    var user = this.getById(id);
    user.firstName = firstName;
    user.lastName = lastName;
    return user;
  };

  this.deleteUser = function(id) {
    // sorry, i'm tired and don't know javascript that well...
    var indexToDelete = -1;
    for (var i = 0; i < this.users.length; i++) {
      var user = this.users[i];
      if (user.id == id) {
        indexToDelete = i;
        break;
      };
    };

    if (indexToDelete >= 0) {
      this.users.splice(indexToDelete, 1);
    };
  };
};
```
As you can see I am just dabbling with JS... 

But hey: It works! ;-)



## Source code for this post

You can clone a copy of this project here: [https://github.com/draptik/angulardemorestful](https://github.com/draptik/angulardemorestful).

To checkout the correct version for this demo, use the following code:

``` sh
git clone git@github.com:draptik/angulardemorestful.git
cd angulardemorestful
git checkout -f step6-nodejs-backend
```

In case you are not using git you can also download the project as ZIP or tar.gz file here: [https://github.com/draptik/angulardemorestful/releases/tag/step6-nodejs-backend](https://github.com/draptik/angulardemorestful/releases/tag/step6-nodejs-backend)
