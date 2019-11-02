
Requirements:
Java : 1.8
Node : 10.x
Maven : 3.5.x
NPM : 6.9.x
Bower : 1.8.8
Gulp : 2.2.0
MongoDB : 4.0.12

follow the below steps:
#---install java---
yum install java-devel java -y
#--- verify java version---
java -version

#---nodejs10.x installation---
yum install gcc-c++ make -y
curl -sL https://rpm.nodesource.com/setup_10.x | sudo -E bash -
yum install nodejs -y

#---verify node & npm version---
node -v 
npm -v

#---Maven3.5.4 Installation---
wget http://www-us.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
tar -xf apache-maven-3.5.4-bin.tar.gz
mv apache-maven-3.5.4 maven


#---verify maven version---
mvn -version

#---Mongodb Installation---
#---create mongodb-org.repo---

vi /etc/yum.repos.d/mongodb-org.repo

#---edit with the below, save & exit---

[mongodb-org-4.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/4.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.0.asc

#---install it now---
yum install mongodb-org -y

#---start the service---
systemctl start mongod

#---Verify the db Installation---
#---Enter below---
mongo
>db.version()

#---output should be something like this---
4.0.12

#---Login to Mongodb and perfomr the below:---
mongo
#---Enter use dashboarddb---
>use dashboarddb

>db.createUser(
                 {
                   user: "dashboarduser",
                   pwd: "dbpassword",
                   roles: [
                      {role: "readWrite", db: "dashboard"}
                           ]
                   })

>exit


#---Install bower and gulp---
npm install bower -g
npm install gulp -g







