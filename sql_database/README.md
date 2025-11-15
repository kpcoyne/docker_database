# Overview

This is a demo database that creates a SQL database container and can populate the databse with .sql files on startup if need be.  A full isolated database can be created in a matter of minutes.

## Build the container

Clone this repository and then change directory into sql_database.

```terminal
docker build -t sql_database .
```

Change to the compose directory 

```terminal
cd ../compose
```

Change the files in the db_data directory.  This path will get mounted inside the
container and the container will execute each of the files in alphabetical order to create
the database or insert data.

Now run the container using composer

```terminal
docker compose up
```

You should now be able to connect to the database using your application or SSIS on port 1433 at the ip address of the host
the container is running on.


