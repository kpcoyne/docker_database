# Overview

This is the files for a docker container and a compose file that will run a MS SQL server in a container.  You can setup the databse
with custom .sql files that will be imported on startup if need be.

## Authenttication

The databse will be setup with an SA account and can be setup with other accounts in the sql files.

## SQL Import

the volume will be mounted at startup and any .sql files in that folder will be imported into the container. It uses a glob pattern match
so that all files will be imported into string order. It is helpful to prefix the files with a string number such as 123_file.sql so that they
are imported in the manner you expect.
