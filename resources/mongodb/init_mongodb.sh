mongo 127.0.0.1/admin --eval 'db.getSiblingDB("dashboarddb").createUser({user: "dashboarduser", pwd: "password", roles: [{role: "readWrite", db: "dashboarddb"}]})'
