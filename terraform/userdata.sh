#¡/bin/bash

###java 1.8 installation

if [ -f "/usr/bin/java" ]; then
echo "JAVA Already Installed in Your System"
else
echo "Install java"
yum install java-devel java -y

echo `java -version`
fi

### Node & Npm installation

if which node > /dev/null
 then
   echo "node& npm is installed, skipping..."
 else
   yum install gcc-c++ make -y
   curl -sL https://rpm.nodesource.com/setup_10.x | sudo -E bash -
   yum install nodejs -y

### verify the node & npm installation

echo `node -v`
echo `npm -v`
fi


### Maven installation

if which mvn > /dev/null
  then
    echo "mvn is installed, skipping..."
  else
    cd /opt
    wget http://www-us.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
    tar -xf apache-maven-3.5.4-bin.tar.gz
    mv apache-maven-3.5.4 maven

### verify the mvn installation

echo `mvn -v`
fi

### Add the below repo file to install latest Mongodb version.
cat <<EOF>> /etc/yum.repos.d/mongodb-org.repo
[mongodb-org-4.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/4.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc
EOF

### Install Mongodb
echo "Installing Mongodb..."
yum install mongodb-org -y
echo "Installed mongodb"

### Start the service
systemctl start mongod


### Verify the mongodb, create the database in mongodb and create an user to access the database

mongo <<EOF
db.version()
use dashboarddb

db.createUser(
                 {
                   user: "dashboarduser",
                   pwd: "dbpassword",
                   roles: [
                      {role: "readWrite", db: "dashboard"}
                           ]
                   })

exit
EOF
###Here we have created a database name as "dashboarddb" , MongoDB username as "dashboarduser" and password is "dbpassword"

### Install bower and gulp

if which bower > /dev/null
  then
    echo "bower is installed, skipping..."
  else
    npm install bower -g
    npm install gulp -g
fi









